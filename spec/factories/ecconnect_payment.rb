# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ecconnect_payment, :class => EcconnectRails::EcconnectPayment do
    amount 20.22
    factory :ecconnect_payment_tran_code do
      amount 20
      tran_code '000'
    end
  end
end