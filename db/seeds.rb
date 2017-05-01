# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing all the models data ..."
User.destroy_all
Tag.destroy_all
Post.destroy_all
Comment.destroy_all
Category.destroy_all

puts "... DONE"

multiplier = 10

puts "creating users"
(multiplier*4).times do |t|
  User.create(
    name: Faker::Name.first_name
    )
end

puts "Creating categories"
multiplier.times do |t|
  Category.create(name: Faker::Book.genre)
end

puts "Creating posts"
multiplier.times do |t|
  Post.create(
    title: Faker::Lorem.sentence(rand(2..8)), 
      body: Faker::Lorem.sentence(rand(20..160)),
      category_id: Category.all.sample.id
      )
end

puts "Creating comments"
(multiplier * 2).times do |t|
  Comment.create(
    comment: Faker::Lorem.sentence(rand(6..60)), 
    user_id: User.all.sample.id, 
    post_id: Post.all.sample.id
    )
end


puts "creating tags"
(multiplier*4).times do |t|
  Tag.create(
    name: Faker::Lorem.sentence(rand(1))
    )
end


  User.all.each {|u| u.posts << Post.all.sample }

  Post.all.each do |p|
    rand(1..3).times do
      p.tags << Tag.all.sample
    end
  end

puts "All data is created now."

