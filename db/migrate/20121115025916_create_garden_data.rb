class CreateGardenData < ActiveRecord::Migration
  def change
    create_table :garden_data do |t|
      t.integer :garden_device_id
      t.decimal :temperature
      t.decimal :humidity

      t.timestamps
    end
  end
end
