# coding: utf-8
class Tarifftreelink < ActiveRecord::Base
  self.table_name = "tariff_tree_link"
  self.primary_key = "tree_id"
  belongs_to :tariffplan, :class_name => 'Tariffplan'
  has_many :moduletarifftrees, :class_name => 'Moduletarifftree', :foreign_key =>'tree_id'
end
