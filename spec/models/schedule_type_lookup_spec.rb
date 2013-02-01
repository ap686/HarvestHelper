require 'spec_helper'

describe ScheduleTypeLookup do
  describe "create" do
    let!(:schedule_type_lookup){FactoryGirl.create(:schedule_type_lookup)}
   	[:name, :flag].each do |att| 
    	it "should have #{att} attribute" do
      	schedule_type_lookup.should validate_presence_of(att)
    	end
    	it "should have unique #{att}" do
      	schedule_type_lookup.should validate_uniqueness_of(att)
    	end
		end
  end
end
