FactoryBot.define do
  factory :brand do
    fantasy_name { Faker::JapaneseMedia::SwordArtOnline.game_name }
    description { Faker::Kpop.solo }
  end
end
