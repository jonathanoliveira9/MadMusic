FactoryBot.define do
  factory :instrument do
    serie { Faker::Music.instrument }
    price { Faker::Number.number(digits: 10) }
    line  { Faker::Music::PearlJam.musician }
    description { Faker::Lorem.paragraph }
  end
end
