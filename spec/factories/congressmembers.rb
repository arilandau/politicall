FactoryGirl.define do
  factory :congressmember do
    full_name 'Selina Meyer'
    party 'D'
    state 'IL'
    chamber 'House'
    leadership_role 'Veep'
    next_election '2020'
    twitter_account 'selina'
    facebook_account 'selina'
    sequence(:phone) { |n| "212-212-#{n}#{n}22" }
    sequence(:email) { |n| "selinameyer2020#{n}@gmail.com" }
    sequence(:url) { |n| "https://selinameyer2020#{n}.com" }
  end
end
