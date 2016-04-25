FactoryGirl.define do
  sequence :email do |n|
    "user#{n+1}@example.com"
  end

  sequence :username do |n|
  	"user#{n+1}"
  end

  factory :user do
    username
    email
    password "password"
    confirmed_at Time.current
    confirmation_token Clearance::Token.new
  end
end
