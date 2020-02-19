# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  Flat.create(name: Faker::Hipster.sentence,
              address: Faker::Address.full_address,
              description: Faker::Movie.quote,
              price_per_night: (100..1000).to_a.sample,
              number_of_guest: (1..7).to_a.sample)
end
