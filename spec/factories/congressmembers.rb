FactoryGirl.define do
  factory :congressmember do
    first_name 'Selena'
    last_name 'Meyer'
    party 'D'
    sequence(:email) { |n| "selenameyer2020#{n}@gmail.com" }
    sequence(:url) { |n| "https://selenameyer2020#{n}.com" }
    next_election '2020'
    sequence(:phone_number) { |n| "212-212-212#{n}" }
    state 'IL'
  end
end
