FactoryBot.define do
  factory :word do
    name       {Faker::Name.last_name}
    pos_id     {Faker::Number.between(from: 1, to: 10)}
    meaning    {Faker::Lorem.sentence}
    genre_id   {Faker::Number.between(from: 1, to: 12)}
    text       {Faker::Lorem.sentence}
    association :user
  end
end
