class AddLongitudeAndLatitudeToGardenDevice < ActiveRecord::Migration
  def change
    add_column :garden_devices, :longitude, :decimal, :precision=> 13, :scale=> 10
    add_column :garden_devices, :latitude, :decimal, :precision=> 13, :scale=> 10
  end
end
