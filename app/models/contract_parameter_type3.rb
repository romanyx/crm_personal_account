# coding: utf-8
class ContractParameterType3 < ActiveRecord::Base

  self.table_name = "contract_parameter_type_3"
  belongs_to :contract, :class_name => 'Contract', :foreign_key => 'cid'

  attr_accessible :pid, :cid, :email

  validates :cid, :pid, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, allow_nil: true
end