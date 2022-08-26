# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

puts "Starting seeds..."
puts "Destroying booking database"
Booking.destroy_all
puts "Destroying review database"
Review.destroy_all
puts "Destroying surfboard database"
Surfboard.destroy_all
puts "Destroying user database"
User.destroy_all

puts "Create users..."
5.times do
  password = "111111"
  user = User.new(
    email: Faker::Internet.email,
    password:,
    password_confirmation: password
  )
  user.save!
end
puts "Users done"

users = User.all

puts "Create Surfboards..."
addresses = ['Rua Rodrigues de Faria 63, Lisboa',
             'Rua do Ginjal 69, Almada',
             'Calçada da Pampulha 27, Lisboa',
             'Rua das Portas de Santo Antão 150, Lisboa',
             'Rua Bulhão Pato 2, Lisboa',
             'Avenida Almirante Reis 1 H, Lisboa',
             'Praça dos Restauradores 79, Lisboa',
             'Rua Gilberto Rola 20, Lisboa',
             'Rua do Loreto 2, Lisboa',
             'Largo Santos 5, Lisboa']

surfboard_photos = [
  "https://www.lisboncrooksandsurfers.com/images/new-boards/custom58blue.jpg",
  "https://www.lisboncrooksandsurfers.com/images/new-boards/abl511creme.jpg",
  "https://www.lisboncrooksandsurfers.com/images/new-boards/facadas68green.jpg",
  "https://www.lisboncrooksandsurfers.com/images/new-boards/facadas72black.jpg",
  "https://www.lisboncrooksandsurfers.com/images/new-boards/rebel70.jpg",
  "https://www.lisboncrooksandsurfers.com/images/new-boards/rebel510.jpg",
  "https://www.lisboncrooksandsurfers.com/images/new-boards/camilo58.jpg",
  "https://www.lisboncrooksandsurfers.com/images/surfboards/anibal/3.jpg",
  "https://www.lisboncrooksandsurfers.com/images/surfboards/killsurfers/1.jpg",
  "https://www.lisboncrooksandsurfers.com/images/surfrentals-2.jpg",
  "https://www.lisboncrooksandsurfers.com/images/surfboards/vinhaca/5.jpg"
]

surfboard_models = [
  "Custom",
  "Splitter",
  "Anibal",
  "Facadas",
  "Facadas",
  "\"Rebel Fins\" Collab Sanna model",
  "\"Rebel Fins\" Collab Rod model",
  "Custom \"Second Hand\"",
  "Anibal",
  "Bare Knees",
  "Vinhaca"
]

surfboard_dimensions = [
  "5'8\" x 20 1/4\" x 2 1/2\" x 31.1L",
  "7'0\" x 21 1/8\" x 2 3/4\" x 45.75 L",
  "5'11\" x 23 5/16\" x 3 1/8\" x 49.6L",
  "6'8\" x 22 1/16\" x 3\" x 50.6 L",
  "7'2\" x 22 1/4\" x 3\" x 54.8 L",
  "7'0\" x 21 1/8\" x 2 3/4\" x 45.75 L",
  "5'10\" x 20 3/4\" x 2 14/25\" x 35 L",
  "5'8\" x 19 1/2\" x 2 7/16\" x 29 L",
  "7'2\" x 22 1/4\" x 3\" x 54.8 L",
  "6'8\" x 22 1/16\" x 3\" x 50.6 L",
  "7'0\" x 21 1/8\" x 2 3/4\" x 45.75 L"
]

surfboard_tail_config = [
  "Twin Future",
  "Twin Future",
  "Quad Future",
  "2 + 1 Future",
  "2 + 1 Future",
  "2 + 1 Future",
  "Thruster Future",
  "Thruster FCS2",
  "2 + 1 Future",
  "Quad Future",
  "Twin Future"
]

10.times do |index|
  file = URI.open(surfboard_photos[index])

  surfboard = Surfboard.new(
    model: surfboard_models[index],
    description: Faker::TvShows::HowIMetYourMother.quote,
    price: rand(25..35),
    user: users.sample,
    rating: 0,
    address: addresses[index],
    dimensions: surfboard_dimensions[index],
    tail_config: surfboard_tail_config[index],
    experience_level: rand(1..3)
  )
  surfboard.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  surfboard.save!
end
puts "Surfboards done"
surfboards = Surfboard.all

puts "Create reviews and bookings..."
surfboards.each do |surfboard|
  # Create a user review per board
  rand(0..3).times do
    review = Review.new(
      review: Faker::TvShows::HeyArnold.quote,
      rating: rand(3..5),
      user: users.sample,
      surfboard:
    )
    review.save!
  end

  rand(1..5).times do |i|
    # Create several bookings per user and board
    month = i + 1
    start_day = rand(13..18)
    end_day = rand(1..7)
    from = Date.new(2022, month, start_day)
    to = Date.new(2022, (month + 1), end_day)
    days = to - from
    booking = Booking.new(
      surfboard:,
      user: users.sample,
      starts_at: from,
      ends_at: to,
      total_price: (1 + days) * surfboard.price,
      acceptance: true,
      comment: Faker::TvShows::TheFreshPrinceOfBelAir.quote
    )
    booking.save!
  end
end
puts "All done! Time for a smoke..."
