require "spec_helper"

describe "GardenData" do
  let!(:garden_data){FactoryGirl.create(:garden_data)}
  
  it "should belong to garden_device" do
    garden_data.should belong_to(:garden_device)
  end
  
  [:garden_device, :sensor_time].each do |attr|
    it "should have #{attr}" do
      garden_data.should validate_presence_of(attr)
    end
  end
  
  [:temperature, :humidity].each do |attr|
    it "should have #{attr} with type decimal" do
      garden_data.should have_db_column(attr).of_type(:decimal)
    end
  end
  
end
