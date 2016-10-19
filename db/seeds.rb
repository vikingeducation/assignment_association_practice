# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Comment.destroy_all
Post.destroy_all
Category.destroy_all
Tag.destroy_all

puts "Old records destroyed."

MULTIPLIER = 5

puts "Creating Users..."
(MULTIPLIER * 2).times do
  User.create(name: Faker::Name.name)
end
puts "Users created."

puts "Creating Categories..."
MULTIPLIER.times do
  Category.create(name: Faker::Commerce.department)
end
puts "Categories created."

puts "Creating Posts..."
User.all.each do |user|
  MULTIPLIER.times do
    user.posts << Post.new(title: Faker::Book.title, body: Faker::Lorem.paragraph, category_id: Category.pluck(:id).sample)
  end
end
puts "Posts created."

puts "Creating Tags..."
Post.all.each do |post|
  3.times do
    post.tags << Tag.new(name: Faker::Beer.hop, category_id: Category.pluck(:id).sample)
  end
end
puts "Tags created"

puts "Creating Comments..."
(MULTIPLIER * 2).times do
  Comment.create(body: Faker::Lorem.sentence, user_id: User.pluck(:id).sample, post_id: Post.pluck(:id).sample)
end
puts "Comments created."
puts "\nDatabase successfully seeded."