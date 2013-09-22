# coding: utf-8
class ChangeStatusLog < ActiveRecord::Base
	belongs_to :contract, foreign_key: "cid"
end
