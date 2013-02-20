FactoryGirl.define do
  factory :garden_device do |garden_device|
    garden_device.name "garden_device_name"
    garden_device.serial_number "serial_number"
    garden_device.association :user
    garden_device.timezone "TIME_ZONE"
  end
end