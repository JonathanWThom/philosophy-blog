# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

10.times do
  User.first.posts.create(
    title: Faker::LordOfTheRings.location,
    body: Faker::Lorem.paragraph,
    created_at: Faker::Date.between(1.year.ago, Date.today)
  )

  User.second.posts.create(
    title: Faker::Pokemon.location,
    body: Faker::Lorem.paragraph,
    created_at: Faker::Date.between(1.year.ago, Date.today)
  )
end
