require 'spec_helper'

describe User do
  describe "create" do
    let!(:user){FactoryGirl.create(:user)}
    [:email, :password, :first_name, :last_name].each do |field|
      it "should have #{field}" do
        user.should validate_presence_of(field)
      end
    end
    
    [:garden_devices, :comments, :posts].each do |field|
      it "should have many #{field}" do
        user.should have_many(field)
      end
    end
  end
end
