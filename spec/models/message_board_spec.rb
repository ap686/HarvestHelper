require 'spec_helper'

describe MessageBoard do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "create" do
    let!(:message_board){FactoryGirl.create(:message_board)}
    it "should have name" do
      message_board.should validate_presence_of(:name)
    end
    
    it "should have many posts" do
      message_board.should have_many(:posts)
    end
  end
end
