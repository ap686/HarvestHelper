class AddIndexToGardenDevicesSerialNumber < ActiveRecord::Migration
  def change
    add_index :garden_devices, :serial_number, unique: true
  end
end
