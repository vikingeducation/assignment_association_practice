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

categories = ['Funny', 'Hilarious', 'Gut-busting', 'Fine', 'Ignorant']
categories.each do |category|
  Category.create(name: category)
end

(MULTIPLIER * 3).times do
  Post.create(title: Faker::Book.title, body: Faker::ChuckNorris.fact, category_id: Category.all.sample.id)
  Tag.create(name: Faker::Superhero.power)
end

Post.all.each do |post|
  [1,2,3].sample.times do
  user = User.all.sample.id
  UsersPost.create(post_id: post.id, user_id: user) unless UsersPost.exists?(:post_id => post.id, :user_id => user)
  end
end

Post.all.each do |post|
  [1,2,3].sample.times do
    tag = Tag.all.sample.id
    Tagging.create(post_id: post.id, tag_id: tag) unless Tagging.exists?(:post_id => post.id, :tag_id => tag)
  end
end

Post.all.each do |post|
  3.times do
    Comment.create(body: Faker::Hipster.sentence, post_id: post.id, user_id: User.all.sample.id)
  end
end
