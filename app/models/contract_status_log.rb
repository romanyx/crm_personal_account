# coding: utf-8
class ContractStatusLog < ActiveRecord::Base
  self.table_name =  "contract_status_log"

  belongs_to :contract, :class_name => 'Contract', :foreign_key => 'cid'
end