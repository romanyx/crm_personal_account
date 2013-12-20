require 'spec_helper'

describe EcconnectRails::EcconnectPaymentsController do
  include Devise::TestHelpers
  routes { EcconnectRails::Engine.routes }
  let(:contract){ FactoryGirl.create :contract }
  let(:authorization){ sign_in contract }
  let(:payment){ FactoryGirl.create :ecconnect_payment }

  describe "POST notify" do
    describe "override methods" do
      before do
        authorization
        payment.update_attributes payer_id: contract.id
        @status = contract.contract_statuses.create status: 0, comment: 'Base status', uid: 11, date1: Time.now - 2.days
        @log_status = contract.contract_status_logs.create date1: Time.now - 2.days, comment: 'Base status', uid: 11, status: 0, date: Time.now - 2.days
        @status_today = contract.contract_statuses.create status: 0, comment: 'Base status', uid: 11, date1: Time.now
        @log_status_today = contract.contract_status_logs.create date1: Time.now, comment: 'Base status', uid: 11, status: 0, date: Time.now
        PaymentMailer.stub_chain('upc_added.deliver').and_return(true)
      end
      context "right signature and code" do
        before{ EcconnectRails::EcconnectPayment.any_instance.stub(:check_signature).and_return(true) }
        it{ expect{ post :notify,  { 'TranCode' => "000", 'OrderID' => payment.order_id.to_s } }.to change{Payment.count}.by(1) }
        it{ expect{ post :notify,  { 'TranCode' => "000", 'OrderID' => payment.order_id.to_s } }.to change{ContractStatusLog.count}.by(0) } # should delete last and create new
        it{ expect{ post :notify,  { 'TranCode' => "000", 'OrderID' => payment.order_id.to_s } }.to change{ContractStatus.count}.by(0) } # should delete last and create new
        #it{ expect{ post :notify,  { 'TranCode' => "000", 'OrderID' => payment.order_id.to_s } }.to change{Delayed::Job.count}.by(1) }
        context "other changes" do
          before{ post :notify,  { 'TranCode' => "000", 'OrderID' => payment.order_id.to_s } }
          it{ contract.balance_summa.should == payment.amount }
          it{ contract.reload.status.should == 0 }
          it{ @status.reload.date2.should_not be_nil }
          it{ @log_status.reload.date2.should_not be_nil }
          it{ expect{@status_today.reload}.to raise_error(ActiveRecord::RecordNotFound) }
          it{ expect{@log_status_today.reload}.to raise_error(ActiveRecord::RecordNotFound) }
          it{ contract.payments.last.summa.should == payment.amount }
        end
      end
      #context "right signature and wrong code" do
        #before{ EcconnectRails::EcconnectPayment.any_instance.stub(:check_signature).and_return(true) }        #before{ post :notify,  {'TranCode' => "403"} }
        #it{ SOME CHANGES }
      #end
      #context "wrong signature" do
        #before{ EcconnectRails::EcconnectPayment.any_instance.stub(:check_signature).and_return(false) }
        #before{ post :notify,  {'TranCode' => "403"} }
        #it{ SOME CHANGES }
      #end
    end
  end
end