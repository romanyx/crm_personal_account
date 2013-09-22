# coding: utf-8
class ContractsController < InheritedResources::Base
  before_filter :authenticate_contract!
  respond_to :html
  actions :index

  def balance
  	@contracts = current_contract.payments.paginate(page: params[:page], per_page: 20)
  end
  
  def status
  end

  def change_status
  	#@contracts = СontractStatus.create(status: 4, uid: 0, data1: Дата начала, date2: Дата конца, comment: 'Установлено пользователем')
  end

  def change_status_log
  	#@contracts = СontractStatusLog.create(status: 4, uid: 0, data1: Дата начала, date2: Дата конца, comment: 'Установлено пользователем', date: Time.now)	
  end

  def update_contract
  end
end