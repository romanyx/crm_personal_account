# coding: utf-8
class MonexyesController < ApplicationController
	before_filter :authenticate_contract!
	respond_to :html
  action :index

  def index

  end

  def success
  	
  end

  def failure
  	
  end
end
