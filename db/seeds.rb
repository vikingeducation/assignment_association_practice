# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "destroying old records..."
Comment.destroy_all
Post.destroy_all
Category.destroy_all
Tag.destroy_all
User.destroy_all
puts "Old records destroyed."


20.times do
  User.create(
    name: Faker::Name.name
  )
end
5.times do
  Category.create(
    name: Faker::HarryPotter.character
  )
end
5.times do
  Tag.create(
    name: Faker::LordOfTheRings.character
  )
end
50.times do
  Post.create(
    title: Faker::StarWars.planet,
    body: Faker::StarWars.quote,
    category_id: Faker::Number.between(1, 5),
    tag_id: Faker::Number.between(1,5)
  )
end
100.times do
  Comment.create(
    body: Faker::StarWars.wookie_sentence,
    user_id: Faker::Number.between(1, 20),
    post_id: Faker::Number.between(1, 50)
  )
end
20.times do |user_id|
  3.times do
    PostsUser.create(
      user_id: user_id,
      post_id: Faker::Number.between(1, 50)
    )
  end
end
50.times do |post_id|
  PostsTag.create(
    post_id: post_id,
    tag_id: Faker::Number.between(1, 5)
  )
end
