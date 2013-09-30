# coding: utf-8
module EcconnectRails
  class EcconnectPaymentsController < EcconnectRails::BaseController
    before_filter :authenticate_contract!
    layout 'application'

  private

    def forward_url_success
      main_app.balance_contract_path 1
    end

    def notify_right_signature ecconnect_payment

    end

    def notify_right_signature_and_code ecconnect_payment
      payment = Payment.create! dt: Time.now, cid: current_contract.id, pt: 1, uid: 0, summa: ecconnect_payment.amount, lm: Time.now, comment: "UPC с карты #{ecconnect_payment.proxy_pan}"
      last_balance = current_contract.last_balance
      Balance.update_all "summa2=#{(ecconnect_payment.amount + last_balance.summa2)} where yy=#{last_balance.yy} and mm=#{last_balance.mm} and cid=#{last_balance.cid} limit 1"
      if ![0,4].include?(current_contract.status) && current_contract.balance_summa > current_contract.closesumma
        current_contract.contract_statuses.build(status: 0, comment: 'Разблокировано системой', uid: 0, date1: Time.now).save
        current_contract.update_attributes status: 0
      end
      PaymentMailer.delay.upc current_contract, payment
    end

    def notify_wrong_signature ecconnect_payment

    end
  end
end