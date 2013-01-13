require 'spec_helper'

describe Comment do
  describe "create" do
    let!(:comment){FactoryGirl.create(:comment)}
    [:content, :post_id, :user_id].each do |attr|
      it "should have #{attr}" do
        comment.should validate_presence_of(attr)
      end
    end
    
    [:user, :post].each do |attr|
      it "should belong to #{attr}" do
        comment.should belong_to(attr)
      end
    end
  end
end
