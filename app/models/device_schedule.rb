class DeviceSchedule < ActiveRecord::Base
  attr_accessible :sensor_flag, :frequency, :is_enabled
  belongs_to :garden_device
  
  validates :garden_device,
              presence: true
  validates :sensor_flag,
              presence: true
              
  def display_time
    self.is_enabled ? "Every " + self.frequency.to_s + " minute".pluralize : "---"
  end
end
