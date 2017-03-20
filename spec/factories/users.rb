FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "lisasimpson2020#{n}@gmail.com" }
    sequence(:username) { |n| "lisasimpson2020#{n}" }
    password 'password'
    password_confirmation 'password'
  end
end
