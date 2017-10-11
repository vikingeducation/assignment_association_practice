# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "delete old data"

Post.delete_all
Comment.delete_all
PostTag.delete_all
Tag.delete_all
Category.delete_all
User.delete_all
UserPost.delete_all

puts "creating users"
20.times do
  u = User.create(:name => Faker::Name.name)
end

puts "creating categories"
20.times do |i|
  ct = Category.create(:name => "Category #{i+1}")
end

puts "creating posts"
20.times do |i|
  p = Post.create(:title => "Post #{i+1}", :body => Faker::Lorem.sentence, :category_id => Category.all.sample.id)
end

puts "creating comments"
20.times do |i|
  c = Comment.create(:body => "Comment #{i+1}", :user_id => User.all.sample.id, :post_id => Post.all.sample.id)
end

puts "creating tags"
20.times do |i|
  c = Tag.create(:name => "Tag #{i+1}")
end

