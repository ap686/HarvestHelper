class ScheduleTypeLookup < ActiveRecord::Base
  attr_accessible :flag, :name
  validates :name, :presence => true
  validates :name, :uniqueness => true
	validates :flag, :presence => true
	validates :flag, :uniqueness => true  
  def get_name
    self.name ||= "No Name"
  end
end
