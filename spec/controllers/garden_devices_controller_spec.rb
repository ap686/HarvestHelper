require 'spec_helper'

describe GardenDevicesController do
  
  describe "Login" do
    before(:each) do
      sign_in garden_device.user
    end
    after(:each) do
      sign_out garden_device.user
    end
    
    let!(:garden_device){ FactoryGirl.create(:garden_device)}
    describe "GET new" do
      it "should render template 'new'" do
        get :new
        response.should render_template("new")
      end
      
      it "should not change the number of garden_device" do
        expect{get :new}.to change{GardenDevice.count}.by(0)
      end
    end
  
    describe "POST create" do
      it "should create a new garden device" do
        expect{post :create,  :garden_device =>  {:name => "somename", :serial_number => "111", :timezone => "TIMEZONE"}}.to change{GardenDevice.count}.by(1)
      end
    end
    
    
    describe "GET index" do
      it "should assign garden device" do
        get :index      
        assigns(:garden_devices).should eq([garden_device])
      end
      
      it "renders the index template" do
        get :index
        response.should render_template("index")
      end
    end
    
    describe "GET show" do
      it "should assign garden device" do
        get :show, :id => garden_device.id
        assigns(:garden_device).should eq(garden_device)
      end
      
      it "should render template 'show'" do
        get :show, :id => garden_device.id
        response.should render_template("show")
      end
    end
    
    describe "GET edit" do
      it "should render template edit" do
        get :edit, :id => garden_device
        response.should render_template("edit")
      end
    end
    
    describe "POST destroy" do
      it "should destroy a garden device" do
        expect{delete :destroy, :id => garden_device}.to change{GardenDevice.count}.by(-1)
      end
    end
    
    describe "PUT update" do
      it "should update a garden device with new attribute" do
        put :update, :id => garden_device, :garden_device => {:name => "new name", :serial_number => "123"}
        assigns(:garden_device).should eq(garden_device) 
      end
    end
  end

end