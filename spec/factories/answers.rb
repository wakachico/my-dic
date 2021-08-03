FactoryBot.define do
  factory :answer do
    word_answer  {Faker::Lorem.sentence}
    score        { 0 }
  end
end
