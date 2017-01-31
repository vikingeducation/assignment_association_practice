# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying old records"

# Blow away all the existing records every time.

User.destroy_all
Post.destroy_all
Category.destroy_all
Tag.destroy_all
Tagging.destroy_all
Comment.destroy_all

puts "Old records destroyed"

# Create Users
5.times do |index|
	user = User.new
	user.name = Faker::Name.name
	user.save!
end

# Create Categories
5.times do |index|
	category = Category.new
	category.name = Faker::GameOfThrones.house
	category.save!
end

categories = Category.all
# Create Posts
25.times do |index|
	post = Post.new
	post.title = Faker::Book.title
	post.body = Faker::Lorem.paragraph
	post.category_id = categories.sample.id
	post.save!
end

# Create Tags
10.times do |index|
	tag = Tag.new
	tag.name = Faker::Lorem.word
	tag.save!
end

posts = Post.all
users = User.all

# Create Comments
40.times do |index|
	comment = Comment.new
	comment.body = Faker::Lorem.paragraph
	comment.post_id = posts.sample.id
	comment.author_id = users.sample.id
	comment.save!
end


tags = Tag.all

# Create Taggings
50.times do |index|
	tagging = Tagging.new
	tagging.post_id = posts.sample.id
	tagging.tag_id = tags.sample.id
	tagging.save!
end

# Associate Post-Author
Post.all.each do |apost|
	blogging = Blogging.new
	blogging.post_id = apost.id
	blogging.author_id = users.sample.id
	blogging.save!
end

20.times do |index|
	blogging = Blogging.new
	blogging.post_id = posts.sample.id
	blogging.author_id = users.sample.id
	blogging.save!
end

puts "DONE!"