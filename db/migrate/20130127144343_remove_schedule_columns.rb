class RemoveScheduleColumns < ActiveRecord::Migration
  def change
    remove_column :device_schedules, :start_time
    remove_column :device_schedules, :end_time
    remove_column :device_schedules, :f_monday
    remove_column :device_schedules, :f_tuesday
    remove_column :device_schedules, :f_wednesday
    remove_column :device_schedules, :f_thursday
    remove_column :device_schedules, :f_friday
    remove_column :device_schedules, :f_saturday
    remove_column :device_schedules, :f_sunday
  end
end
