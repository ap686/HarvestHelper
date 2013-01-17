require 'spec_helper'

describe PostsController do

  let!(:user){FactoryGirl.create(:user)}
  let!(:post){ FactoryGirl.create(:post, :user => user)}
  describe 'login' do
    
    before(:each) do
      sign_in user
    end
      
    after(:each) do
      sign_out user
    end
  
    describe "GET 'show'" do
      it "returns http success" do
        get :show, :id => post.id
        response.should be_success
      end
      
      it "should render #show view" do
        get :show, :id => post.id
        response.should render_template :show
      end
    end
  
    describe "GET 'new'" do
      it "returns http success" do
        get 'new'
        response.should be_success
      end
    end
  
    describe "GET 'create'" do
      it "returns http success" do
        get 'create'
        response.should be_success
      end
    end
  
    describe "GET 'destroy'" do
    end
  end
end
