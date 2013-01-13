FactoryGirl.define do
  factory :device_schedule do |device_schedule|
    device_schedule.association :garden_device
  end
end