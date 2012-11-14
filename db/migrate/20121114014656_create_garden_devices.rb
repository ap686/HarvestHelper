class CreateGardenDevices < ActiveRecord::Migration
  def change
    create_table :garden_devices do |t|
      t.string :serial_number
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
