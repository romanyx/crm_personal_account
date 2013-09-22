# coding: utf-8
class InetService < ActiveRecord::Base
  self.table_name = "inet_serv_14"
  has_one :contract, class_name: 'Contract', foreign_key: 'contractId'
end
