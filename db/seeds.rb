# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Instrument.destroy_all
Brand.destroy_all

brands = []
15.times do |_|
  brands << Brand.create(
  fantasy_name:  Faker::JapaneseMedia::SwordArtOnline.game_name,
  description:  Faker::Kpop.solo)
end

200.times do |_|
  Instrument.create(
    serie: Faker::Music.instrument,
    price: Faker::Number.number(digits: 10),
    line: Faker::Music::PearlJam.musician,
    description: Faker::Lorem.paragraph,
    brand_id: brands.sample.id)
end


