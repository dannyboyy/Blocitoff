# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.save!
end
users = User.all


# Create items for the to-do-list
20.times do
 Item.create!(
  body:         Faker::Lorem.sentence(1),
  days_left:    Faker::Number.number(1)
 )
end

items = Item.all

User.first.update_attributes!(
  email: 'wushuo1988@hotmail.com',
  password: 'helloworld',
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} posts created"