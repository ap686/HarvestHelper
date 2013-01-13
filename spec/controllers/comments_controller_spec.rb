require 'spec_helper'

describe CommentsController do
  
  let!(:user){FactoryGirl.create(:user)}
  let!(:post){FactoryGirl.create(:post, :user => user)}
  before(:each) do
    sign_in user
  end
    
  after(:each) do
    sign_out user
  end

  describe "POST 'create'" do
    it "create a new comment" do

    end
  end

  describe "GET 'destroy'" do    
  end

end
