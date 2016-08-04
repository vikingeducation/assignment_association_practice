# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

multiplier = 10

multiplier.times do |n|
  a = User.create {
    name: "user#{n}"
  }
  (multiplier/2).times do |m|
  a.create_post {
    title: "title#{m}",
    body: "Some long blurb #{m}"
  }
  end
end

puts "users created"

multiplier.times do |n|
  Post.create {

  }
end