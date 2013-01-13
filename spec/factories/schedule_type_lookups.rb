FactoryGirl.define do
  factory :schedule_type_lookup do |schedule_type_lookup|
    schedule_type_lookup.flag "this is a comment"
    schedule_type_lookup.name "schedule type lookup name"
  end
end