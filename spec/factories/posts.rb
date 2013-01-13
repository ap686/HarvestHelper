FactoryGirl.define do
  factory :post do |post|
    post.content "post_content"
    post.title "post_title"
    post.association :user
    post.association :message_board
  end
end