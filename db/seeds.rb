# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create items for the to-do-list
20.times do
 Item.create!(
  body:         Faker::Lorem.sentence(1),
  days_left:    Faker::Number.number(1)
 )
end

items = Item.all

puts "Seed finished"
puts "#{Item.count} itemss created"