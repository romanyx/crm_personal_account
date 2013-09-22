# coding: utf-8
class Flag < ActiveRecord::Base
  self.table_name = "contract_parameter_type_5"
  self.primary_key = "cid"
  belongs_to :contract, :class_name => 'Contract', :foreign_key => 'cid'
  #pid 46 = SMS
  #pid 47 = Email рассылка
  #pid 48 = Изменение статуса
  #pid 56 = Наличие подписаного договора
end
