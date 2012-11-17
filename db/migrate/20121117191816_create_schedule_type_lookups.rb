class CreateScheduleTypeLookups < ActiveRecord::Migration
  def change
    create_table :schedule_type_lookups do |t|
      t.string :flag
      t.string :name

      t.timestamps
    end
  end
end
