class GardenData < ActiveRecord::Base
  attr_accessible :humidity, :temperature, :lux
  belongs_to :garden_device
end
