FactoryGirl.define do
  factory :user do |user|
    user.email "user@example.com"
    user.first_name "first"
    user.last_name "last"
    user.password "password"
    user.password_confirmation "password"
  end
end