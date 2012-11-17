class AddIndexToScheduleTypeLookupFlag < ActiveRecord::Migration
  def change
    add_index :schedule_type_lookups, :flag, unique: true
  end
end
