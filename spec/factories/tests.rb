FactoryBot.define do
  factory :test do
    type_id     {Faker::Number.between(from: 1, to: 10)}
    association :user
  end
end
