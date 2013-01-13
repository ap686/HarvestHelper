require "spec_helper"

describe "DeviceSchedule" do
  describe "create" do
    let!(:device_schedule){FactoryGirl.create(:device_schedule)}
    
    it "should belong to garden device" do
      device_schedule.should belong_to(:garden_device)
    end
    
    it "should have garden device" do
      device_schedule.should validate_presence_of(:garden_device)
    end
  end
end