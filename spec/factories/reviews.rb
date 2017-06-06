FactoryGirl.define do
  factory :review do
    association :idea, factory: :idea
    association :user, factory: :user
    body Faker::Friends.quote
  end
end
