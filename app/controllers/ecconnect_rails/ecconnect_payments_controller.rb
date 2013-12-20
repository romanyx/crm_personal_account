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
      if !ecconnect_payment.status
        contract = Contract.find ecconnect_payment.payer_id
        last_balance = contract.last_balance
        payment = Payment.create! dt: Time.now, cid: contract.id, pt: 1, uid: 11, summa: ecconnect_payment.amount, lm: Time.now, comment: "UPC карта #{ecconnect_payment.proxy_pan} код #{ecconnect_payment.approval_code}"
        Balance.update_all "summa2=#{(ecconnect_payment.amount + last_balance.summa2)} where yy=#{last_balance.yy} and mm=#{last_balance.mm} and cid=#{last_balance.cid} limit 1"
        if ![0,4].include?(contract.status) && contract.balance_summa + ecconnect_payment.amount > contract.closesumma
          time = Time.now
          if contract.contract_statuses.where(date1: time.to_date).count > 0
            contract.contract_statuses.where(date1: time.to_date).delete_all
            contract.contract_status_logs.where(date1: time.to_date).delete_all
          end
          if contract.contract_statuses.last.date2.nil?
            contract.contract_statuses.last.update_attributes(date2: time-1.day)
            contract.contract_status_logs.last.update_attributes(date2: time-1.day)
          end
          contract.contract_statuses.create status: 0, comment: 'Разблокировано электронным платежом', uid: 11, date1: time
          contract.contract_status_logs.create date1: time, comment: 'Разблокировано электронным платежом', uid: 11, status: 0, date: time
          contract.update_attributes(status: 0)
        end
        ecconnect_payment.update_attributes status: true
      end
    end

    def notify_wrong_signature ecconnect_payment

    end
  end
end