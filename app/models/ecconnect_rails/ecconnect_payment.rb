require 'digest/sha1'
require 'base64'
require 'openssl'
require 'autoinc'
module EcconnectRails
  class EcconnectPayment
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Autoinc

    CURRENCY = [980, 643, 840, 978]

    field :delay, type: Boolean
    field :merchant_id, type: Integer
    field :terminal_id, type: String
    field :tran_code, type: String
    field :approval_code, type: Integer
    field :locale, type: String
    field :proxy_pan, type: String
    field :currency_id, type: Integer
    field :alt_currency_id, type: Integer
    field :amount, type: Float
    field :alt_amount, type: Integer
    field :order_id, type: Integer
    field :income_signature, type: String
    field :purchase_desc, type: String
    field :email, type: String
    field :sd, type: String
    field :xid, type: String
    field :rrn, type: String
    field :payer_id, type: Integer
    field :status, type: Boolean, default: false

    increments :order_id, seed: 1

    validates :merchant_id, :terminal_id, :currency_id, :amount, presence: true
    before_validation :set_terminal_id, :set_merchant_id, :set_locale, :set_currency_id
    before_create :set_tran_code

    def purchase_time
      self.created_at.strftime("%Y%m%d%H%M%S%z") if self.created_at
    end

    def currency
      I18n.t "ecconnect_rails.currency_#{self.currency_id}"
    end

    def request_data
      @request_data ||= make_request_data
    end

    def check_data
      @check_data ||= make_check_data
    end

    def signature
      @signature ||= sign(request_data)
    end

    def upc_amount 
      (self.amount*100).to_i
    end

    def code
      I18n.t "ecconnect_rails.codes.code_#{self.tran_code}" if self.tran_code
    end

    def ecconnect_json
      self.as_json(except: [:income_signature, :proxy_pan, :rrn, :sd, :xid, :approval_code], methods: [:purchase_time, :signature, :code])
    end

    #def check_payment
    #  uri = URI.parse EcconnectRails.default_options[:check_url]
    #  http = Net::HTTP.new uri.host, uri.port
    #  http.use_ssl = true
    #  request = Net::HTTP::Post.new uri.path
    #  request.set_form_data check_payment_data
    #  response = http.request request
    #end

    def check_signature
      cert.public_key.verify OpenSSL::Digest::SHA1.new, Base64.decode64(self.income_signature), check_data
    end

    def update_by params
      self.update_attributes :proxy_pan => params[:ProxyPan],
                             #:currency => params[:Currency],
                             :approval_code => params[:ApprovalCode],
                             #:merchant_id => params[:MerchantID],
                             #:order_id => params[:OrderID],
                             :income_signature => params[:Signature],
                             :rrn => params[:Rrn],
                             :xid => params[:XID],
                             :email => params[:Email],
                             :sd => params[:SD],
                             :tran_code => params[:TranCode]
                             #:terminal_id => params[:TerminalID],
                             #:total_amount => params[:TotalAmount],
                             #:alt_total_amount => params[:AltTotalAmount],
                             #:alt_currency => params[:AltCurrency]
    end


  private
    def set_locale
      self.locale = I18n.locale.to_s
    end

    def set_currency_id
      self.currency_id = EcconnectRails.default_options[:currency_id]
    end

    def set_terminal_id
      self.terminal_id = EcconnectRails.default_options[:terminal_id]
    end

    def set_merchant_id
      self.merchant_id = EcconnectRails.default_options[:merchant_id]
    end

    def set_tran_code
      self.tran_code = nil
    end

    #def check_payment_data
    #  data = {}
    #  data['MerchantID'] = self.merchant_id if self.merchant_id
    #  data['TerminalID'] = self.terminal_id if self.terminal_id
    #  data['TotalAmount'] = self.upc_amount if self.upc_amount
    #  data['AltTotalAmount'] = self.alt_amount if self.alt_amount
    #  data['Currency'] = self.currency_id if self.currenc_id
    #  data['AltCurrency'] = self.alt_currency_id if self.alt_currency_id
    #  data['OrderID'] = self.order_id if self.order_id
    #  data
    #end

    def sign data
      Base64.encode64(pem.sign(OpenSSL::Digest::SHA1.new, data)).gsub(/\n/, '')
    end

    def pem
      OpenSSL::PKey::RSA.new File.read EcconnectRails.default_options[:pem_path]
    end

    def cert
      OpenSSL::X509::Certificate.new File.read EcconnectRails.default_options[:cert_path]
    end

    #MerchantId;TerminalId;PurchaseTime;OrderId,Delay;Xid;CurrencyId,AltCurrencyId;Amount,AltAmount;SessionData;TranCode;ApprovalCode;
    def make_check_data
      data = ""
      data << (self.merchant_id.nil? ? "" : "#{self.merchant_id}")
      data << (self.terminal_id.nil? ? ";" : ";#{self.terminal_id}")
      data << ";#{self.purchase_time}"
      data << ";#{self.order_id}"
      data << (self.delay.nil? ? "" : ", #{self.delay}")
      data << (self.xid.nil? ? ";" : ";#{self.xid}")
      if self.currency_id.nil?
        data << ";"
      else
        data << ";#{self.currency_id}"
        data << (self.alt_currency_id.nil? ? "" : ", #{self.alt_currency_id}")
      end
      if self.amount.nil?
        data << ";"
      else
        data << ";#{self.upc_amount}"
        data << (self.alt_amount.nil? ? "" : ", #{self.alt_amount}")
      end
      data << (self.sd.nil? ? ";" : ";#{self.sd}")
      data << (self.tran_code.nil? ? ";" : ";#{self.tran_code}")
      data << (self.approval_code.nil? ? ";" : ";#{self.approval_code}")
      data << ";"
      data
    end

    #MerchantId;TerminalId;PurchaseTime;OrderId,Delay;CurrencyId,AltCurrencyId;Amount,AltAmount;SessionData(SD);
    def make_request_data
      data = ""
      data << (self.merchant_id.nil? ? "" : "#{self.merchant_id}")
      data << (self.terminal_id.nil? ? ";" : ";#{self.terminal_id}")
      data << ";#{self.purchase_time}"
      data << ";#{self.order_id}"
      data << (self.delay.nil? ? "" : ", #{self.delay}")
      if self.currency_id.nil?
        data << ";"
      else
        data << ";#{self.currency_id}"
        data << (self.alt_currency_id.nil? ? "" : ", #{self.alt_currency_id}")
      end
      if self.amount.nil?
        data << ";"
      else
        data << ";#{self.upc_amount}"
        data << (self.alt_amount.nil? ? "" : ", #{self.alt_amount}")
      end
      data << (self.sd.nil? ? ";" : "#{;self.sd}")
      data << ";"
      data
    end
  end
end