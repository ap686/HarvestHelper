class Post < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :message_board
  belongs_to :user
  has_many :comments
  
  validates :content,
              presence: true
  validates :title,
              presence: true
  validates :message_board_id,
              presence: true
  validates :user_id,
              presence: true
end
