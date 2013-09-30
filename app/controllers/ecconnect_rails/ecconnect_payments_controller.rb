# coding: utf-8
module EcconnectRails
  class EcconnectPaymentsController < EcconnectRails::BaseController
    before_filter :authenticate_contract!, except: [:notify]
    layout 'application'

  private

    def success_respond ecconnect_payment
      redirect_to main_app.balance_contract_path(1), :status => :moved_permanently
    end

    def forward_url_success
      'http://billing.crimeainfo.com/ecconnect_rails/ecconnect_payments/success'
    end

    def notify_right_signature ecconnect_payment

    end

    def notify_right_signature_and_code ecconnect_payment
      contract = Contract.find ecconnect_payment.payer_id
      payment = Payment.create! dt: Time.now, cid: contract.id, pt: 1, uid: 0, summa: ecconnect_payment.amount, lm: Time.now, comment: "UPC с карты #{ecconnect_payment.proxy_pan}"
      last_balance = contract.last_balance
      Balance.update_all "summa2=#{(ecconnect_payment.amount + last_balance.summa2)} where yy=#{last_balance.yy} and mm=#{last_balance.mm} and cid=#{last_balance.cid} limit 1"
      if ![0,4].include?(contract.status) && contract.balance_summa > contract.closesumma
        contract.contract_statuses.build(status: 0, comment: 'Разблокировано системой', uid: 0, date1: Time.now).save
        contract.update_attributes status: 0
      end
      PaymentMailer.delay.upc contract, payment
    end

    def notify_wrong_signature ecconnect_payment

    end
  end
end