class AddSensorTimeToGardenData < ActiveRecord::Migration
  def change
    add_column :garden_data, :sensor_time, :datetime
  end
end
