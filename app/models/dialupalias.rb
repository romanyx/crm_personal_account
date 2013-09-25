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

end
