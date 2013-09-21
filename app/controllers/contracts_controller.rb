class ContractsController < InheritedResources::Base
	before_filter :authenticate_contract!
  respond_to :html
  actions :index

  def balance
  end
  
  def status
  	
  end
end