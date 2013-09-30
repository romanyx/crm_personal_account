class ContractStatusObserver < ActiveRecord::Observer
  observe :contract_status

  def after_create record
    contract = record.contract
    contract.contract_status_logs.create date1: record.date1,
                                         date2: record.date2,
                                         comment: record.comment,
                                         uid: 0,
                                         status: record.status,
                                         date: Time.now
    #contract.update_attributes status: record.status if record.status != 0
  end
end