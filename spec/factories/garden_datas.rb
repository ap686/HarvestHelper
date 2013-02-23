FactoryGirl.define do
  factory :garden_data do |garden_data|
    garden_data.temperature 50.0
    garden_data.humidity    50.0
    garden_data.lux         50.0
    garden_data.sensor_time Time.utc(2013, 2, 22, 12, 0, 0)
    garden_data.association :garden_device
  end
end