class AddIsEnabledToDeviceSchedules < ActiveRecord::Migration
  def change
    add_column :device_schedules, :is_enabled, :boolean
  end
end
