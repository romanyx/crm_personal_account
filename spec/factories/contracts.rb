# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :contract do
    gr 32 
    title "01-001" 
    title_pattern_id 0
    pswd "zxqrew"
    date1 Time.now
    closesumma -10.20
    pgid 2
    fc true
    comment "Test"
    del false
    sub_mode 0
    status 0
    status_date Time.now
  end
end
