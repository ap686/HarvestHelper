class DeviceSchedule < ActiveRecord::Base
  attr_accessible :end_time, :f_friday, :f_monday, :f_saturday, :f_sunday, :f_thursday, :f_tuesday, :f_wednesday, :frequency, :sensor_flag, :start_time
  belongs_to :garden_device
end
