require 'spec_helper'

describe MessageBoardsController do
  describe "Not login" do
    describe "GET 'index'" do
      it "returns http success" do
        pending 'TODO'
        get 'index'
        response.should redirect_to(root_path)
      end
    end
  
    describe "GET 'show'" do
      it "returns http success" do
        pending 'TODO'
        get 'show'
        response.should be_success
      end
    end
  end
end
