class DeviceSchedule < ActiveRecord::Base
  attr_accessible :sensor_flag, :frequency, :is_enabled
  belongs_to :garden_device
  
  validates :garden_device,
              presence: true
  validates :sensor_flag,
              presence: true
end
