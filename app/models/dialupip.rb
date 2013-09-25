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


end
