FactoryBot.define do
  factory :item do
    price       { rand 20...100 }
    name        { Faker::Lorem.word.downcase }
    real        { [true, false].sample }
    weight      { rand 5...10 }
    description { Faker::Lorem.word.downcase }
  end
end