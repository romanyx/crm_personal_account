# coding: utf-8
class Contract < ActiveRecord::Base
  #include ActiveModel::SerializerSupport
  self.table_name =  "contract"
  self.primary_key = "id"

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

  STATUS = ['Активен', 'В отключении', 'Отключен', 'Закрыт', 'Приостановлен', 'В подключении']
  

  devise :database_authenticatable, :authentication_keys => [:title] 

  attr_accessible :title, :pswd, :password, :encrypted_password
  
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

  def self.tariffs_array(id)
    array = []
    tarray = []
    allsums = 0
    fincost = 0
    id = Contract.find(id)
    id.ctariffs.where("date2 is NULL").each do |tp|
      title = tp.tariffplan.title
      tp.tariffplan.moduletarifftrees.each do |md|
        mtreen = md.mtreenodes.where("type LIKE '%_cost'").find(:all, :select => "type as etype, data")[0]
        if mtreen != nil
          fincost = mtreen.data.gsub(/(.+)&/,"")
          allsums += fincost.to_i
        end
      end
      tarray << {:title => title , :cost => fincost }
    end
    pfincost = 0
    id.contracttreelinks.where("date2 is NULL").each do |ptp|
      title = ptp.title
      ptp.moduletarifftrees.each do |pmd|
        pmtreen = pmd.mtreenodes.where("type LIKE '%_cost'").find(:all, :select => "type as etype, data")[0]
        if pmtreen != nil
          pfincost = pmtreen.data.gsub(/(.+)&/,"")
          allsums += pfincost.to_i
        end
      end
      tarray << {:title => title , :cost => pfincost }
    end
    return array << {"tplans" => tarray, "allcost" => allsums}
  end

  def self.tariffs_all
    File.open(Rails.root.join('public/kirill.txt'), 'a') do |file|
      ContractParameterType7Value.where(id:[100,109,110,73,74,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92]).order("title ASC").each do |r|
        file.puts "       #{r.title}"
        r.contracts.each do |c|
          file.puts "#{c.comment} - #{Contract.tariffs_array(c.id)[0]["allcost"]}"
        end
      end
    end
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

  def current_balance
    Balance.by_cmy self.id, Time.now.month, Time.now.year
  end

  def last_balance
    @last_balance ||= get_last_balance
  end

  def get_last_balance
    summa = balances.order("yy DESC").first
    if summa.nil?
      summa = Balance.new summa1: 0, summa2: 0, summa3: 0, summa4: 0
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

  def self.cached_users id=0
    Rails.cache.fetch("cached_users_for#{id}", expires_in: 30.minutes) do
      contracts = Contract.joins(:contract_parameter_type7).where('contract_parameter_type_7.pid=54')
      if id.eql?(0)
        contracts.map do |c|
          ContractSerializer.new(c, root: false).serializable_hash
        end
      else
        contracts.joins(:contract_parameter_type8).where("contract_parameter_type_8.val=#{id}").map do |c|
          ContractSerializer.new(c, root: false).serializable_hash
        end
      end
    end
  end

end
