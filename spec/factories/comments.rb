FactoryGirl.define do
  factory :comment do |comment|
    comment.content "this is a comment"
    comment.association :user, :email => "other@email.com"
    comment.association :post
  end
end