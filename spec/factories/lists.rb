FactoryGirl.define do
  factory :list do
    sequence(:name) { |n| "New List Name#{n}#{n}" }
  end
end
