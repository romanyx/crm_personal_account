#module EcconnectRails
  #module ApplicationHelper
    #def ecconnect_form(ecconnect_payment, options={}, &block)
      #id = options.fetch(:id, 'ecconnect_form')
      #result = ''
      #content_tag(:form, id: id, action: EcconnectRails.default_options[:request_url], method: :post) do
        #result += hidden_field_tag(:Version, 1)
        #result += hidden_field_tag(:MerchantID, ecconnect_payment.merchant_id) if ecconnect_payment.merchant_id
        #result += hidden_field_tag(:TerminalID, ecconnect_payment.terminal_id) if ecconnect_payment.terminal_id
        #result += hidden_field_tag(:Currency, ecconnect_payment.currency_id) if ecconnect_payment.currency_id
        #result += hidden_field_tag(:AltCurrency, ecconnect_payment.alt_currency_id) if ecconnect_payment.alt_currency_id
        #result += hidden_field_tag(:TotalAmount, ecconnect_payment.upc_amount) if ecconnect_payment.upc_amount
        #result += hidden_field_tag(:AltTotalAmount, ecconnect_payment.alt_amount) if ecconnect_payment.alt_amount
        #result += hidden_field_tag(:locale, ecconnect_payment.locale)
        #result += hidden_field_tag(:PurchaseTime, ecconnect_payment.purchase_time) if ecconnect_payment.purchase_time
        #result += hidden_field_tag(:OrderID, ecconnect_payment.order_id)
        #result += hidden_field_tag(:SD, ecconnect_payment.sd) if ecconnect_payment.sd
        #result += hidden_field_tag(:Delay, ecconnect_payment.delay) if ecconnect_payment.delay
        #result += hidden_field_tag(:Signature, ecconnect_payment.signature)
        #result += hidden_field_tag(:PurchaseDesc, ecconnect_payment.purchase_desc) if ecconnect_payment.purchase_desc
        #if block_given?
          #result += yield
        #else
          #result += submit_tag(I18n.t('ecconnect_rails.ecconnect_form.submit'), name: nil)
        #end
        #result.html_safe
      #end
    #end
  #end
#end