# coding: utf-8
class Tariffplan < ActiveRecord::Base
  self.table_name = "tariff_plan"
  self.primary_key = "tree_id"
  belongs_to :ctariff, :class_name => 'Ctariff'
  has_many :contracts, :through => :ctariff
  has_many :ctariffs, :class_name => 'Ctariff'
  has_many :moduletarifftrees, :class_name => 'Moduletarifftree', :foreign_key =>'tree_id'
  has_one :tarifftreelink, :class_name => 'Tarifftreelink', :foreign_key =>'tpid'
  def self.array_of
  	array = []
  	Tariffplan.all.each{|t|
  		array << {:id => t.title, :title => t.title}}
  	return array
  end
end
