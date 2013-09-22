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
    #СontractStatus.create status: 4, uid: 0, data1: Дата начала, date2: Дата конца, comment: 'Установлено пользователем'
    #СontractStatusLog.create status: 4, uid: 0, data1: Дата начала, date2: Дата конца, comment: 'Установлено пользователем', date: Time.now
  end

private
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