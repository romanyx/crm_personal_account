# coding: utf-8
class ContractsController < InheritedResources::Base
  before_filter :authenticate_contract!
  respond_to :html
  actions :index

  def balance
  	if current_contract.balance_days_left <= 5
      flash[:error] = "Пополните счет"
  	end
    @balances = current_contract.balances.order('yy DESC, mm ASC').paginate(page: params[:id], per_page: 5)
  end

  def payment
    @payments = current_contract.payments.order('dt DESC').paginate(page: params[:id], per_page: 5)
    @options = ["test1", "test2"]
  end
  
  def status
    @status = current_contract.contract_statuses.build
    #@statuses = current_contract.contract_status_logs.order('date DESC').paginate(page: params[:id], per_page: 5)
    @statuses = current_contract.contract_statuses.order('date1 ASC').paginate(page: params[:id], per_page: 5)
    @status_actives = current_contract.contract_status_logs
  end

  def update_contract
    email = current_contract.update_email params[:email]
    sms = current_contract.update_sms params[:sms]
    error = (email.errors.full_messages + sms.errors.full_messages).join(', ')
    if error.blank?
      error = nil 
      notice = 'Данные обновлены'
    end
    redirect_to root_path, flash: { error: error, notice: notice }
  end

  def change_status
    if params[:contract_status][:status].to_i == current_contract.status
      redirect_to status_contract_path(1), flash: { error: 'Данный статус уже установлен' }
    elsif [0, 4].include?(params[:contract_status][:status].to_i)
      @status = current_contract.contract_statuses.build(params[:contract_status].merge(comment: 'Установлено пользователем', uid: 0))
      if @status.save
        current_contract.update_attributes(status: 0) if params[:contract_status][:status].to_i == 0
        redirect_to status_contract_path(1), flash: { notice: 'Статус поставлен в очередь' }
      else
        @statuses = current_contract.contract_status_logs.order('date DESC').paginate(page: (params[:id]||=1), per_page: 5)
        flash[:error] = 'Ошибка при изменении статуса'
        render 'status'
      end
    else
      redirect_to status_contract_path(1), flash: { error: Contract::STATUS[current_contract.status] + ', статус невозможно изменить' }
    end
  end
end