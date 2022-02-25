# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

puts "Deleting animals and users..."
Animal.destroy_all
User.destroy_all

names = [
  %w[lydia alles],
  %w[kang hsieh],
  %w[stella raab],
  %w[ida schwarzkopf]
]

puts "creating users..."
names.each do |name|
  user = User.create(
    email: "#{name[0]}@#{name[1]}.com",
    password: "123456",
    first_name: name[0],
    last_name: name[1]
  )
  file = File.open(Rails.root.join("app/assets/images/seed/user_#{name[0]}.jpg"))
  user.photo.attach(io: file, filename: "user_#{name[0]}.png", content_type: 'image/png')
  user.save
end
# User.create(email: "lydia@alles.com", password: "123456")
# User.create(email: "kang@hsieh.com", password: "123456")
# User.create(email: "stella@raab.com", password: "123456")
# User.create(email: "ida@schwarzkopf.com", password: "123456")

puts "creating animals..."
counter = 0
species = %w[turtle dog fish possum bird reptile tapir]
10.times do
  counter += 1
  # make sure that images for seed animals are correctly named in app/assets/images/seed
  file = File.open(Rails.root.join("app/assets/images/seed/animal_#{counter}.jpg"))
  animal = Animal.create(
    name: Faker::Name.first_name,
    age: rand(0..20),
    price: rand(5..30),
    species: species.sample,
    description: 'This is a very good animal, he eats a lot though. And bites. He is a muscular marsupial, native to Australia. He is mainly nocturnal, emerging at night to feed on grasses, herbs, bark, and roots.'
  )
  animal.user = User.all.sample
  animal.photo.attach(io: file, filename: "animal_#{counter}.png", content_type: 'image/png')
  animal.save
end

puts "created new seeds"
