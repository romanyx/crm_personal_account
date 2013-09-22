# coding: utf-8
class Dialuplogin < ActiveRecord::Base

# !Внимание можно заменить строки
# self.table_name = "user_login_#{Bgmodule.find_by_name("dialup").id}" if !Rails.env.test?
# self.table_name = "#{ActiveRecord::Base.connection.execute("show tables like 'user_login_%';").first[0]}"  if Rails.env.test?
# на
# self.table_name = "user_login_6" , где 6 - id модуля dialup в таблице module
# это в среднем ускорит процесс на 0.3ms в production/development и на 4.4ms в test

  # Данная строка устанавливает название таблицы для production/development
  self.table_name = "user_login_6" 
  # Данная строка устанавливает название таблицы для test,
  # т.к база данных для тестов пустая и имеет только структуру
  #self.table_name = "#{ActiveRecord::Base.connection.execute("show tables like 'user_login_%';").first[0]}" if Rails.env.test?
  self.primary_key  = "id"

  belongs_to :contract, :class_name => 'Contract', :foreign_key => 'cid'
  has_one :dialupip, :class_name => 'Dialupip', :foreign_key => 'id'
  has_one :dialupalias, :class_name => 'Dialupalias', :foreign_key => 'login_id'

  has_many :dialuperrors, :class_name => 'Dialuperror', :foreign_key => 'lid'
end