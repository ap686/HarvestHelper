class GardenData < ActiveRecord::Base
  attr_accessible :humidity, :temperature
  belongs_to :garden_device
end
