class GardenDevice < ActiveRecord::Base
  attr_accessible :name, :serial_number
  belongs_to :user
  has_many :garden_datas
  has_many :device_schedules
  
  before_save { |device| device.serial_number = serial_number.downcase }
  
  validates :name,
              presence: true
  validates :serial_number,
              presence: true,
              uniqueness: { case_sensitive: false }
end
