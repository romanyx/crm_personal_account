# coding: utf-8
class ContractsController < InheritedResources::Base
  before_filter :authenticate_contract!
  respond_to :html
  actions :index

  def balance
  	if current_contract.balance_days_left <= 5
      flash[:error] = "Пополните счет"
  	end
    @payments = current_contract.payments.order('dt DESC').paginate(page: params[:id], per_page: 5)
  end
  
  def status
    if ![0, 4].include?(current_contract.status)
      flash[:error] = Contract::STATUS[current_contract.status] + ', статус невозможно изменить'
    end
    @statuses = current_contract.contract_status_logs.order('date DESC').paginate(page: params[:id], per_page: 5)
  end

  def update_contract
    email = update_email current_contract.contract_parameter_type3.where(pid: 8).last
    sms = update_sms current_contract.flags.where(pid: 46).last
    error = (email.errors.full_messages + sms.errors.full_messages).join(', ')
    if error.blank?
      error = nil 
      notice = 'Данные обновлены'
    end
    redirect_to root_path, flash: { error: error, notice: notice }
  end

  def change_status
    p params[:contract_status_log][:date1]
    if [0, 4].include? params[:status].to_i
      update_status params[:status].to_i, params[:start_time], params[:end_time]
      redirect_to status_contracts_path, flash: { notice: 'Статус поставлен в очередь' }
    else
      redirect_to status_contracts_path, flash: { error: 'Данный статус невозможно изменить' }
    end
  end

private

  def update_status contract_status_log
    if Date.new(contract_status_log['date1(1i)'], contract_status_log['date1(2i)', contract_status_log['date1(3i)']]) <= Date.now
      contract_status_log['date1(1i)'] = Date.now.year
      contract_status_log['date1(2i)'] = Date.now.month
      contract_status_log['date1(3i)'] = Date.now.day
    end
    if !contract_status_log['date2(1i)'].nil? && Date.new(contract_status_log['date2(1i)'], contract_status_log['date2(2i)', contract_status_log['date2(3i)']]) <= Date.now
      contract_status_log['date2(1i)'] = Date.now.year
      contract_status_log['date2(2i)'] = Date.now.month
      contract_status_log['date2(3i)'] = Date.now.day
    end
    current_contract.contract_status.create params[:contract_status_log].merge(comment: 'Установлено пользователем')
    current_contract.contract_status_log.create params[:contract_status_log].merge(comment: 'Установлено пользователем', date: Time.now)   
  end

  def update_email email
  	if email.nil?
      email = current_contract.contract_parameter_type3.build(pid: 8, email: params[:email])
      email.save
    else
      email.update_attributes(email: params[:email]) if !email.nil?
    end
    email
  end

  def update_sms sms
    if params[:sms].to_i == 0 || params[:sms].nil?
      if sms.nil?
        sms = current_contract.flags.build(pid: 46, val: 0)
        sms.save
      else
        sms.update_attributes(val: 0)
      end
    else
      if sms.nil?
        sms = current_contract.flags.build(pid: 46, val: 1)
        sms.save
      else
        sms.update_attributes(val: 1)
      end
    end
    sms
  end
end