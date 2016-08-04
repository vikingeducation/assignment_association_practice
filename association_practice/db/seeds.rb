# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MULTIPLIER = 10

MULTIPLIER.times do
  User.create(name: Faker::Name.name)
end

User.each do |user|
  3.times do
    Post.create(title: Faker::Book.title, body: Faker::ChuckNorris.fact, user_id: user.id)
  end
end

categories = ['Funny', 'Hilarious', 'Gut-busting', 'Fine', 'Ignorant']
categories.each do |category|
  Category.create(name: category)
end

Post.each do |post|
  3.times do
    Comment.create(body: Faker::Hipster.sentence, post_id: post.id, user_id: User.all.sample.id)
  end
end
