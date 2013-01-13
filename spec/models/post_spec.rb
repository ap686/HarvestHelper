require 'spec_helper'

describe Post do
  describe "create" do
    let!(:post){FactoryGirl.create(:post)}
    [:content, :title, :user_id, :message_board_id].each do |attr|
      it "should have #{attr}" do
        post.should validate_presence_of(attr)
      end
    end
    
    [:user, :message_board].each do |attr|
      it "should belong to #{attr}" do
        post.should belong_to(attr)
      end
    end
    
    it "should have many comments" do
      post.should have_many(:comments)
    end
  end
end
