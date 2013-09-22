# coding: utf-8
class ChangeStatus < ActiveRecord::Base
	belongs_to :contract, foreign_key: "cid"
end
