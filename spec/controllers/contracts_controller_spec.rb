# coding: utf-8
require 'spec_helper'

describe ContractsController do
  include Devise::TestHelpers
  let(:contract){ FactoryGirl.create :contract }
  let(:authorization){ sign_in(contract) }

  describe 'GET index' do
    before{ authorization; get :index }
    context 'unauthorized' do
      let(:authorization){ nil }
      it{ response.should redirect_to new_contract_session_path }
    end
    context 'authorized' do
      it{ response.should render_template 'index' }
    end
  end

  describe 'GET balance' do
    before{ authorization; get :balance, { id: 1 } }
    context 'unauthorized' do
      let(:authorization){ nil }
      it{ response.should redirect_to new_contract_session_path }
    end
    context 'authorized' do
      it{ response.should render_template 'balance' }
      it{ assigns(:payments).should == contract.payments.order('dt DESC').paginate(page: 1, per_page: 5)}
    end
  end

  describe 'GET status' do
    before{ authorization; get :status }
    context 'unauthorized' do
      let(:authorization){ nil }
      it{ response.should redirect_to new_contract_session_path }
    end
    context 'authorized' do
      it{ response.should render_template 'status' }
      it{ assigns(:statuses).should == contract.contract_status_logs.order('date DESC').paginate(page: 1, per_page: 5) }
    end
  end

  describe 'POST update_contract' do
    context 'unauthorized' do
      before{ authorization; post :update_contract }
      let(:authorization){ nil }
      it{ response.should redirect_to new_contract_session_path }
    end
    describe 'authorized' do
      describe "invalid params" do
        context "email" do
          before{ authorization; post :update_contract, { sms: 0, email: 'my1.mail.ru' } }
          it{ response.should redirect_to root_path }
          it{ flash[:error].should == 'Email имеет неверное значение' }
          it{ contract.contract_parameter_type3.where(pid:8).limit(1).last.should == nil }
        end
        #context "sms" do
        #  before{ authorization; post :update_contract, { sms: nil, email: 'my1@mail.ru' } }
        #  it{ response.should redirect_to root_path }
        #  it{ flash[:error].should == 'Val не может быть пустым' }
        #  it{ contract.flags.where(pid:46).limit(1).last.should == 0 }
        #end
      end
      context "valid params" do
        before{ authorization; post :update_contract, { sms: 0, email: 'my@mail.ru' } }
        it{ response.should redirect_to root_path }
        it{ contract.contract_parameter_type3.where(pid:8).last.email.should == 'my@mail.ru' }
        it{ contract.flags.where(pid:46).last.val.should == 0 }
        it{ contract.contract_parameter_type3.where(pid:8).count.should == 1 }
        it{ contract.flags.where(pid:46).count.should == 1 }
        it{ flash[:notice].should == 'Данные обновлены' }
      end
      context "valid with existing flags and email" do
        before do
          FactoryGirl.create :email, contract: contract
          FactoryGirl.create :sms, contract: contract
          authorization
          post :update_contract, { sms: 0, email: 'my@mail.ru' }
        end
        it{ response.should redirect_to root_path }
        it{ contract.contract_parameter_type3.where(pid:8).last.email.should == 'my@mail.ru' }
        it{ contract.flags.where(pid:46).last.val.should == 0 }
        it{ contract.contract_parameter_type3.where(pid:8).count.should == 1 }
        it{ contract.flags.where(pid:46).count.should == 1 }
        it{ flash[:notice].should == 'Данные обновлены' }
      end
    end
  end
  describe 'POST change_status' do
    context 'unauthorized' do
      before{ authorization; post :change_status }
      let(:authorization){ nil }
      it{ response.should redirect_to new_contract_session_path }
    end
    describe 'authorized' do
    end
  end
end
