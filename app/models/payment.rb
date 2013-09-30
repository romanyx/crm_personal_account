# coding: utf-8
class Payment < ActiveRecord::Base
  self.table_name =  "contract_payment"
  self.primary_key = "id"

  attr_accessible :dt, :cid, :pt, :uid, :summa, :comment, :lm

  belongs_to :contract, :class_name => 'Contract', :foreign_key => 'cid'
  belongs_to :payment_type, :class_name => 'PaymentType', :foreign_key =>'pt'
  belongs_to :user, :class_name => 'User', :foreign_key => 'uid'
end
