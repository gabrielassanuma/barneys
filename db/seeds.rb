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

10.times do |index|
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/a/a5/Tom_Delonge_with_surfboard.jpg")

  surfboard = Surfboard.new(
    title: Faker::WorldCup.roster,
    description: Faker::TvShows::HowIMetYourMother.quote,
    price: rand(25..35),
    user: users.sample,
    rating: rand(2..5),
    address: addresses[index]
  )
  surfboard.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  surfboard.save!
end
