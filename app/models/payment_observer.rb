class PaymentObserver < ActiveRecord::Observer
  observe :payment

  #def after_create record
    #PaymentMailer.upc_added(record, "pays@crimeainfo.com").deliver
  #end
end
