FactoryGirl.define do
  factory :idea do
  association :user, factory: :user
  sequence(:title) { |n| Faker::Job.key_skill + "#{n}"}
  body Faker::HowIMetYourMother.quote
  end
end
