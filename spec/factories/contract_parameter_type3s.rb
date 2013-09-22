# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contract_parameter_type3 do
    factory :email do
      pid 8 
      email "ukrgazprom@gmail.com"
    end
  end
end
