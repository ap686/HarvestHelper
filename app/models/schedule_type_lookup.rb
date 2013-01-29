class ScheduleTypeLookup < ActiveRecord::Base
  attr_accessible :flag, :name
  
  def get_name
    self.name ||= "No Name"
  end
end
