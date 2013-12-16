# coding: utf-8
class Contract < ActiveRecord::Base
  #include ActiveModel::SerializerSupport
  self.table_name =  "contract"
  self.primary_key = "id"

  attr_accessible :status

  has_many :phones, :class_name => "Phone", :foreign_key => "cid"

  has_many :agent_payments

  has_many :smses, :class_name => "Sms", :foreign_key => "cid"

  has_many :flags, :class_name => "Flag", :foreign_key => "cid"

  has_many :dialuperrors, :class_name => 'Dialuperror', :foreign_key => 'cid'

  has_many :payments, :class_name => 'Payment', :foreign_key => 'cid'

  has_many :balances, :class_name => 'Balance', :foreign_key => 'cid'

  has_many :dialuplogins, :class_name => 'Dialuplogin', :foreign_key =>'cid'
  has_many :dialupips, :through => :dialuplogins
  has_many :dialupaliases, :through => :dialuplogins
  
  has_many :contract_modules, :class_name => 'ContractModule', :foreign_key => 'cid'
  has_many :bgmodules, :through => :contract_modules

  has_many :ctariffs, :class_name => 'Ctariff', :foreign_key =>'cid'
  has_many :tariffplans, :through => :ctariffs
  has_many :contracttreelinks, :class_name => 'Contracttreelink', :foreign_key =>'cid'

  has_many :contract_parameter_type1, :class_name => 'ContractParameterType1', :foreign_key => 'cid'

  has_many :contract_parameter_type2, :class_name => 'ContractParameterType2', :foreign_key => 'cid'
  has_many :contract_parameter_type3, :class_name => 'ContractParameterType3', :foreign_key => 'cid'

  has_many :contract_parameter_type6, :class_name => 'ContractParameterType6', :foreign_key => 'cid'

  has_many :contract_parameter_type7, :class_name => 'ContractParameterType7', :foreign_key => 'cid'
  has_many :contract_parameter_type7_values, :through => :contract_parameter_type7

  has_many :contract_parameter_type8, :class_name => 'ContractParameterType8', :foreign_key => 'cid'
  has_many :contract_statuses, :class_name => 'ContractStatus', :foreign_key => 'cid'
  has_many :contract_status_logs, :class_name => 'ContractStatusLog', :foreign_key => 'cid'
  has_many :inet_services, class_name: 'InetService', foreign_key: 'contractId'
  #has_many :ecconnect_payments, class_name: 'EcconnectRails:EcconnectPayment', foreign_key: 'payer_id'

  STATUS = ['Активен', 'В отключении', 'Отключен', 'Закрыт', 'Приостановлен', 'В подключении']
  

  devise :database_authenticatable, :authentication_keys => [:title] 

  attr_accessible :title, :pswd, :password, :encrypted_password, :status
  
  def valid_password?(password)
  	return false if pswd.blank?
    Devise.secure_compare(password, pswd)
  end

  def authenticatable_salt
    pswd
  end

  def password=(new_password)
    @password = new_password
    #self.encrypted_password = password_digest(@password) if @password.present?
  end

  def mobile_phone
    allowed = %w[+38050 +38066 +38095 +38099 +38067 +38096 +38097 +38098 +38063 +38093 +38068 +38091 +38092]
    phone = self.phones.where(pid: 14).first
    if phone.nil?
      nil
    else
      phone = "+380" + phone.value.gsub(/\W/,"").match(/[0-9]{9}$/).to_s
      p phone
      if allowed.include? phone[0..5]
        phone
      else
        nil
      end
    end
  end

  def update_email email
    current_email = self.contract_parameter_type3.where(pid: 8).last
    if current_email.nil?
      current_email = self.contract_parameter_type3.build(pid: 8, email: email)
      current_email.save
    else
      current_email.update_attributes(email: email) if !current_email.nil?
    end
    current_email
  end

  def update_sms flag
    sms = self.flags.where(pid: 46).last
    if flag.nil?
      if sms.nil?
        sms = self.flags.build(pid: 46, val: 0)
        sms.save
      else
        sms.update_attributes(val: 0)
      end
    else
      if sms.nil?
        sms = self.flags.build(pid: 46, val: 1)
        sms.save
      else
        sms.update_attributes(val: 1)
      end
    end
    sms
  end

  def last_balance
    @last_balance ||= get_last_balance
  end

  def get_last_balance
    summa = balances.order("yy DESC").first
    if summa.nil?
      summa = Balance.create! summa1: 0, summa2: 0, summa3: 0, summa4: 0, yy: Time.now.year, mm: Time.now.month, cid: self.id
    elsif summa.mm < Time.now.month || summa.yy < Time.now.year
      summa = Balance.create! summa1: (summa.summa1 + summa.summa2 - summa.summa3 - summa.summa4), summa2: 0, summa3: 0, summa4: 0, yy: Time.now.year, mm: Time.now.month, cid: self.id
    end
    summa
  end

  def balance_summa
    summa = last_balance
    summa.summa1 + summa.summa2 - summa.summa3 - summa.summa4
  end

  def balance_days_left
    summa = last_balance
    one_day = summa.summa3 / Time.now.day
    if one_day > 0 
      balance_summa / one_day
    else
      0
    end
  end
end
