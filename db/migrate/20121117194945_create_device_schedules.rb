class CreateDeviceSchedules < ActiveRecord::Migration
  def change
    create_table :device_schedules do |t|
      t.string :sensor_flag
      t.integer :frequency
      t.time :start_time
      t.time :end_time
      t.boolean :f_monday
      t.boolean :f_tuesday
      t.boolean :f_wednesday
      t.boolean :f_thursday
      t.boolean :f_friday
      t.boolean :f_saturday
      t.boolean :f_sunday
      t.integer :garden_device_id

      t.timestamps
    end
  end
end
