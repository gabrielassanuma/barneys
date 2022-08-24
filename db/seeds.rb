# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

Surfboard.destroy_all
User.destroy_all

5.times do
  password = Faker::Alphanumeric.alphanumeric(number: 10)
  user = User.new(
    email: Faker::Internet.email,
    password:,
    password_confirmation: password
  )
  user.save!
end

users = User.all

10.times do
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/a/a5/Tom_Delonge_with_surfboard.jpg")

  surfboard = Surfboard.new(
    description: Faker::TvShows::HowIMetYourMother.quote,
    price: rand(25..35),
    user: users.sample,
    rating: rand(2..5)
  )
  surfboard.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  surfboard.save!
end
