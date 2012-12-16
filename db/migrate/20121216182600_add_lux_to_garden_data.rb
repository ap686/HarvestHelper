class AddLuxToGardenData < ActiveRecord::Migration
  def change
    add_column :garden_data, :lux, :decimal
  end
end
