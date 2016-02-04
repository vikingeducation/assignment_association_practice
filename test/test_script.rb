require_relative 'test_helper'

Hirb.enable

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
p User.posts
p User.comments
puts 'Post...'
p Post.users
p Post.comments
p Post.categories
p Post.tags

puts 'Comment...'
p Comment.users
p Comment.posts

puts 'Tag...'
p Tag.posts

puts 'Category...'
p Category.posts
