# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

Animal.destroy_all
User.destroy_all

User.create(email: "lydia@alles.com", password: "123456")
kang = User.create(email: "kang@hsieh.com", password: "123456")
User.create(email: "stella@raab.com", password: "123456")
User.create(email: "ida@schwarzkopf.com", password: "123456")

# 15.times do
#   animal = Animal.create(name: Faker::Name.name, age: rand(0..20), price: rand(10..40), species: Faker::Creature::Animal.name)
#   animal.user = User.all.sample
#   animal.save
# end

file = URI.open('https://i.natgeofe.com/n/8271db90-5c35-46bc-9429-588a9529e44a/raccoon_thumb_3x4.JPG')
animal = Animal.create(
  name: Faker::Name.name,
  age: rand(0..20), price: rand(10..40),
  species: Faker::Creature::Animal.name,
  description: 'Lorem ipsum'
)
animal.user = kang
animal.photo.attach(io: file, filename: 'possum.png', content_type: 'image/png')
animal.save
# puts "created animals"
