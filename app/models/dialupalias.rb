# coding: utf-8
class Dialupalias < ActiveRecord::Base

# !Внимание можно заменить строки
# self.table_name = "user_alias_#{Bgmodule.find_by_name("dialup").id}" if !Rails.env.test?
# self.table_name = "#{ActiveRecord::Base.connection.execute("show tables like 'user_alias_%';").first[0]}"  if Rails.env.test?
# на
# self.table_name = "user_alias_6" , где 6 - id модуля dialup в таблице module
# это в среднем ускорит процесс на 0.3ms в production/development и на 4.4ms в test

  # Данная строка устанавливает название таблицы для production/deveopment
  self.table_name = "user_alias_6"
  # Данная строка устанавливает название таблицы для test,
  # т.к база данных для тестов пустая и имеет только структуру
  #self.table_name = "#{ActiveRecord::Base.connection.execute("show tables like 'user_alias_%';").first[0]}" if Rails.env.test?
  self.primary_key = "login_id"

  belongs_to :dialuplogin, :class_name => 'Dialuplogin', :foreign_key => 'login_id'
  has_one :contract, :through => :dialuplogin

  has_many :dialuperrors, :class_name => 'Dialuperror', :foreign_key => 'lid'

  def self.change_ip
  	dontfind = []
  	File.open(Rails.root.join("ips.txt"), 'r+') do |file|
      file.each_line { |line|
  	    array  = line.gsub(/\n$/, "").split("\ ")
  	    login = array[0].gsub(/login\=/, "")
  	    ip = array[1].gsub(/ip\=/, "")
  	    billing_ip = array[2].gsub(/vip\=/, "") 
  	    login_alias = Dialupalias.find_by_login_alias login
  	    if !login_alias.nil?
  	      login = login_alias.dialuplogin
  	      login.dialupip.aton billing_ip
  	      contract = login.contract
  	      shluz = contract.contract_parameter_type1.where(pid: 35).first
  	      shluz.update_attribute(:val, "#{ip.gsub(/\.[0-9]+$/, ".1")}")
  	      #dogovor_ip = contract.contract_parameter_type1.where(pid: 34).first
  	      #dogovor_ip.update_attribute(:val, "#{ip} / 255.255.255.0")
          ActiveRecord::Base.connection.execute("UPDATE `contract_parameter_type_1` SET `val` = '#{"#{ip} / 255.255.255.0"}' WHERE `contract_parameter_type_1`.`pid` = 34 AND `contract_parameter_type_1`.`cid` = #{contract.id}")
          #p login
          #p ip
          #p billing_ip
        else
        	dontfind.push login
  	    end
  	  }
  	  file.close
  	end
  	p dontfind
  end

end
