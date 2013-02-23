class GardenData < ActiveRecord::Base
  attr_accessible :humidity, :temperature, :lux, :sensor_time
  validates :garden_device, :sensor_time,
              presence: true
  belongs_to :garden_device
end
