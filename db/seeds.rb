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

# -----create objects-----

5.times do
  User.create(
    name: Faker::Name.name
  )
end
3.times do
  Category.create(
    name: Faker::HarryPotter.character
  )
end
3.times do
  Tag.create(
    name: Faker::LordOfTheRings.character
  )
end
20.times do
  Post.create(
    title: Faker::StarWars.planet,
    body: Faker::StarWars.quote,
    category_id: Faker::Number.between(1, 5),
  )
end
20.times do
  Comment.create(
    body: Faker::StarWars.wookie_sentence,
  )
end

# -----associate objects-----
      #associate user with comments
5.times do |user_id|
  3.times do
    UserComments.create(
      user_id: user_id,
      comment_id: Faker::Number.between(1, 20)
    )
  end

      #associate user with posts
5.times do |user_id|
  3.times do
    PostsUsers.create(
      user_id: user_id,
      post_id: Faker::Number.between(1, 20)
    )
  end
end

    #assciate post with tags
20.times do |post_id|
  2.times do
    PostTags.create(
      post_id: post_id,
      tag_id: Faker::Number.between(1, 3)
    )
  end
end
