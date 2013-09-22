# coding: utf-8
class Ctariff < ActiveRecord::Base
  self.table_name = "contract_tariff"
  self.primary_key = "tpid"
  belongs_to :contract, :class_name => 'Contract', :foreign_key =>'cid'
  has_one :tariffplan, :class_name => 'Tariffplan', :foreign_key =>'id'
end
