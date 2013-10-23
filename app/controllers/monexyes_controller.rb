# coding: utf-8
class MonexyesController < ApplicationController
	before_filter :authenticate_contract!
	respond_to :html
  action :index

  def index

  end

  def success
    #contract = current_contract
    #payment = Payment.create! dt: Time.now, cid: contract.id, pt: 1, uid: 11, summa: ecconnect_payment.amount, lm: Time.now, comment: "Оплата Monexy по договору #{contract.title}"
    #last_balance = contract.last_balance
    #Balance.update_all "summa2=#{(ecconnect_payment.amount + last_balance.summa2)} where yy=#{last_balance.yy} and mm=#{last_balance.mm} and cid=#{last_balance.cid} limit 1"
      #if ![0,4].include?(contract.status) && contract.balance_summa > contract.closesumma
        #contract.contract_statuses.build(status: 0, comment: 'Разблокировано системой', uid: 0, date1: Time.now).save
        #contract.update_attributes status: 0
      #end
    flash[:notice] = "Оплата прошла успешно"
  end

  def failure
  	flash[:error] = "Оплата не прошла"
  end
end
