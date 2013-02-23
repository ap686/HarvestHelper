require "spec_helper"

describe "GardenDevice" do
  describe "create" do
    let!(:garden_device){FactoryGirl.create(:garden_device)}
    
    [:name, :serial_number, :user].each do |attr|
      it "should validate presence of #{attr}" do
        garden_device.should validate_presence_of(attr)
      end
    end
    
    [:name, :serial_number].each do |attr|
      it "should validate uniqueness of #{attr}" do
        garden_device.should validate_uniqueness_of(attr)
      end

    end
        
    [:garden_datas, :device_schedules].each do |attr|
      it "should have many #{attr}" do
        garden_device.should have_many(attr)
      end
    end
    
    it "should belong to user" do
      garden_device.should belong_to(:user)
    end
  end
end
