FactoryGirl.define do
  factory :garden_device do |garden_device|
    garden_device.name "garden_device_name"
    garden_device.serial_number "serial_number"
    garden_device.association :user
  end
end