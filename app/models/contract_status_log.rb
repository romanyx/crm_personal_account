# coding: utf-8
class ContractStatusLog < ActiveRecord::Base
  self.table_name =  "contract_status_log"

  attr_accessible :status, :date1, :date2, :comment, :date, :uid, :cid

  belongs_to :contract, :class_name => 'Contract', :foreign_key => 'cid'

  validates :date1, presence: true
  #validates :date1, date: { after: Proc.new { Time.now } }, if: lambda{|status| status.status == 4 }
  #validates :date1, date: { before: :date2 }, if: :date2_exist?
  #validates :date2, date: { after: :date1 }, allow_nil: true

  default_scope { order('id ASC') }

  def date2_exist?
    !self.date2.nil?
  end
end