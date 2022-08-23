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

20.times do
  password = Faker::Alphanumeric.alphanumeric(number: 10)
  user = User.new(
    email: Faker::Internet.email,
    password:,
    password_confirmation: password
  )
  user.save
end

100.times do
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")

  surfboard = Surfboard.new(
    description: Faker::TvShows::HowIMetYourMother.quote,
    price: rand(25..35),
    user_id: rand(1..20),
    rating: rand(2..5)
  )
  surfboard.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  surfboard.save
end
