FactoryGirl.define do
  factory :user do
    first_name 'Lisa'
    last_name 'Simpson'
    sequence(:username) { |n| "newusername#{n}#{n}" }
    sequence(:email) { |n| "newemail#{n}#{n}#{n}@gmail.com" }
    password 'password'
    password_confirmation 'password'
  end
end
