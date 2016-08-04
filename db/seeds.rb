# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing database..."
User.destroy_all
Post.destroy_all
Comment.destroy_all
Tag.destroy_all
Category.destroy_all
UserPost.destroy_all
PostTag.destroy_all
puts "Database cleared!"


puts "Creating Users..."
5.times do
  User.create(name: Faker::Name.name)
end

puts "Creating categories..."
3.times do 
  Category.create(name: Faker::Lorem.word)
end

puts "Creating Posts..."
10.times do
  Post.create(title: Faker::Lorem.sentence[1..15], 
           body: Faker::Lorem.paragraph[1..30],
           category_id: Category.all.sample.id)
end

puts "Creating Comments..."
10.times do
  Comment.create(body: Faker::Lorem.sentence[1..20],
              post_id: Post.all.sample.id,
              user_id: User.all.sample.id)
end

puts "Creating Tags..."
5.times do
  Tag.create(name: Faker::Lorem.word)
end

puts "Creating UserPosts..."
Post.all.each do |post|
  UserPost.create(user_id: User.all.sample.id,
               post_id: post.id)
end

puts "Creating PostTags..."
10.times do
  PostTag.create(post_id: Post.all.sample.id,
                 tag_id: Tag.all.sample.id)
end

puts "Database created!"



