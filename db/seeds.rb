# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy all data..."

User.destroy_all
Post.destroy_all
Category.destroy_all
Comment.destroy_all
Tag.destroy_all

puts "All data destroied!"

MULTIPLIER = 10

puts "Seeding category..."

MULTIPLIER.times do
  c = Category.new
  c[:name] = Faker::Commerce.department(1)
  c.save!
end
puts "Category deeded!"

puts "Seeding users..."
MULTIPLIER.times do
  u = User.new
  u[:name] = Faker::Name.name
  u.save!
end
puts "Users seeded!"

puts "Seeding posts..."
(MULTIPLIER * 5).times do
  p = Post.new
  p[:title] = Faker::Lorem.sentence
  p[:body] = Faker::Lorem.paragraphs
  p[:category_id] = Category.pluck(:id).sample
  p.save!
end
puts "Posts seeded!"

puts "Seeding tags..."
MULTIPLIER.times do
  t = Tag.new
  t[:name] = Faker::Lorem.word
  t.save!
end
puts "Tags seeded!"

puts "Seeding comments..."
(MULTIPLIER * 5).times do
  c = Comment.new
  c[:post_id] = Post.pluck(:id).sample
  c[:user_id] = User.pluck(:id).sample
  c[:body] = Faker::Lorem.paragraph
  c.save!
end
puts "Comments seeded!"

posts_ids = Post.pluck(:id) + Post.pluck(:id).reverse
users_ids = User.pluck(:id) * 10
puts "Seeding user_posts..."
(MULTIPLIER * 10).times do
  up = UserPost.new
  up[:user_id] = users_ids.pop
  up[:post_id] = posts_ids.pop
  up.save!
end
puts 'User_posts seeded!'


posts_ids = Post.pluck(:id) + Post.pluck(:id).reverse
tags_ids = Tag.pluck(:id) * 2
puts "Seeding post_tags..."
(MULTIPLIER * 2).times do
  pt = PostTag.new
  pt[:post_id] = posts_ids.pop
  pt[:tag_id] = tags_ids.pop
  pt.save!
end
puts "Tags seeded!"
puts "Done!"
