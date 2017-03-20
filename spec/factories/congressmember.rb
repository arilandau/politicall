FactoryGirl.define do
  factory :congressmember do
    first_name 'Lisa'
    last_name 'Simpson'
    party 'D'
    sequence(:email) { |n| "lisasimpson2020#{n}@gmail.com" }
    sequence(:url) { |n| "https://lisasimpson2020#{n}.com" }
    next_election '2020'
    sequence(:phone_number) { |n| "212-212-212#{n}" }
    state 'IL'
  end
end
