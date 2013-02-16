class AddTimezoneToGardenDevice < ActiveRecord::Migration
  def change
    add_column :garden_devices, :timezone, :string
  end
end
