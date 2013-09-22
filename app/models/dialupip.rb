# coding: utf-8
require "ipaddr"

class Dialupip < ActiveRecord::Base

# !Внимание можно заменить строки
# self.table_name = "radius_pair_ip_#{Bgmodule.find_by_name("dialup").id}" if !Rails.env.test?
# self.table_name = "#{ActiveRecord::Base.connection.execute("show tables like 'radius_pair_ip_%';").first[0]}"  if Rails.env.test?
# на
# self.table_name = "radius_pair_ip_6" , где 6 - id модуля dialup в таблице module
# это в среднем ускорит процесс на 0.3ms в production/development и на 4.4ms в test

  # Данная строка устанавливает название таблицы для production/development
  self.table_name = "radius_pair_ip_6"
  # Данная строка устанавливает название таблицы для test,
  # т.к база данных для тестов пустая и имеет только структуру
  #self.table_name = "#{ActiveRecord::Base.connection.execute("show tables like 'radius_pair_ip_%';").first[0]}" if Rails.env.test?
  self.primary_key = "id"

  belongs_to :dialuplogin, :class_name => 'Dialuplogin', :foreign_key => 'id'
  has_one :contract, :through => :dialuplogin

  # Поиск по IP
  def self.find_aton(ipaddr="")
  	dialupip = Dialupip.find_by_ip(IPAddr.new(ipaddr).to_i)
  end

  def aton(ipaddr)
    self.update_attribute(:ip, IPAddr.new(ipaddr).to_i)
  end

  def self.ntoa(ipaddr)
    ip = IPAddr.new(ipaddr, Socket::AF_INET).to_s
  end

  def self.ipcount
    File.open(Rails.root.join("ips.txt"), 'r+') do |file|
      file.each_line { |line|
        array  = line.gsub(/\n$/, "").split("\ ")
        login = array[0].gsub(/login\=/, "")
        ip = array[1].gsub(/ip\=/, "")
        billing_ip = array[2].gsub(/vip\=/, "") 
        if Dialupip.where(ip: IPAddr.new(billing_ip).to_i).count > 1
          self.contract_and_alias(billing_ip)
        end
      }
      file.close
    end
  end

  def self.contract_and_alias(ip)
    Dialupip.where(ip: IPAddr.new(ip).to_i).each{|i|
      p "#{ip} #{i.contract.title} - #{i.contract.comment}"
    }
  end

end


#"10.10.131.250 12-015 - Аверьянова Марина Владимировна"
#"10.10.131.250 12-999 - Зубко тестовые/служебные логины - kometa_test1"
#"10.10.131.245 12-068 - Рыбалко Ольга "
#"10.10.131.245 12-074 - Хливная Нина "
#"10.10.131.240 12-089 - Котельникова"
#"10.10.131.240 12-090 - Назаров"
#"10.10.131.209 12-040 - Попова "
#"10.10.131.209 12-075 - Кайко Ленара Наримановна "
#"10.10.131.20 12-013 - Зейтулаева Азиме "
#"10.10.131.20 12-100 - Петров Владимир Юрьевич"
