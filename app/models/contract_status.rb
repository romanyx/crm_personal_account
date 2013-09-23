# coding: utf-8
class ContractStatus < ActiveRecord::Base
  self.table_name =  "contract_status"

  belongs_to :contract, :class_name => 'Contract', :foreign_key => 'cid'
end