# coding: utf-8
class Phone < ActiveRecord::Base
  self.table_name = "contract_parameter_type_phone"
  self.primary_key = "cid"
  belongs_to :contract, :class_name => 'Contract', :foreign_key => 'cid'

  attr_accessible :pid, :cid, :value
end