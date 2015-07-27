# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do 
  User.create({name: Faker::Name.name })
end

10.times do
  Post.create({ title: Faker::Name.title ,  body: Faker::Name.title, user_id: rand(1..5) })
end
