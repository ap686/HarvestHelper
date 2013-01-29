FactoryGirl.define do
  factory :device_schedule do |device_schedule|
    device_schedule.association :garden_device
    device_schedule.sensor_flag "Device Schedule Flag"
  end
end