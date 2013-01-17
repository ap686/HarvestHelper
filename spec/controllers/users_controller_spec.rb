require 'spec_helper'

describe UsersController do
  let!(:user){FactoryGirl.create(:user)}
  
  before(:each) do
    sign_in user
  end
    
  after(:each) do
    sign_out user
  end
  
  describe "GET 'show'" do
    it "returns http success" do
      get :show
      response.should be_success
    end
    
    it "assign the requested user to @user" do
      get :show
      assigns(:user).should eq(user)
    end
    
    it "renders the #show view" do
      get :show
      response.should render_template :show
    end
  end

end
