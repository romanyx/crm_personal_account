# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :flag do
    factory :sms do
      pid 46
      val 1
    end
  end
end
