require 'spec_helper'

describe ScheduleTypeLookup do
  describe "create" do
    let!(:schedule_type_lookup){FactoryGirl.create(:schedule_type_lookup)}
    
    it "should have name attribute" do
      schedule_type_lookup.should validate_presence_of(:name)
    end
    
    it "should have unique name" do
      schedule_type_lookup.should validate_uniqueness_of(:name)
    end
  end
end
