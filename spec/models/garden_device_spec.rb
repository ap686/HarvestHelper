require "spec_helper"

describe "GardenDevice" do
  describe "create" do
    let!(:garden_device){FactoryGirl.build(:garden_device)}
    
    [:name, :serial_number].each do |attr|
      it "should validate presence of #{attr}" do
        garden_device.should validate_presence_of(attr)
      end
    end
  end
end
