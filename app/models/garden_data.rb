class GardenData < ActiveRecord::Base
  attr_accessible :humidity, :temperature, :lux
  validates :garden_device,
              presence: true
  belongs_to :garden_device
end
