#require_relative 'test_helper.rb'

#Hirb.enable

puts "All the things!"
p User.all
p Post.all
p Category.all
p Comment.all
p Tag.all
p PostTag.all
p UserPost.all

puts "Checking associations"
puts "User..."
p User.first.posts
p User.first.comments
puts 'Post...'
p Post.first.users
p Post.first.comments
p Post.first.categories
p Post.first.tags

puts 'Comment...'
p Comment.first.users
p Comment.first.posts

puts 'Tag...'
p Tag.first.posts

puts 'Category...'
p Category.first.posts
