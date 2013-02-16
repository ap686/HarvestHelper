class GardenDevice < ActiveRecord::Base
  attr_accessible :name, :serial_number, :timezone
  attr_accessible :name, :serial_number, :timezone, :user_id, as: :admin
  
  belongs_to :user
  has_many :garden_datas
  has_many :device_schedules
  
  before_save { |device| device.serial_number = serial_number.downcase }
  
  validates :name, :user, :timezone,
              presence: true
  validates :serial_number,
              presence: true,
              uniqueness: { case_sensitive: false }
end
