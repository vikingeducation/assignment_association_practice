#require 'hirb'

Hirb.enable

user = User.first
post = Post.first
comment = Comment.first
tag = Tag.first
category = Category.first

puts "All the things!"
p User.all
p Post.all
p Category.all
p Comment.all
p Tag.all
p PostTag.all
p UserPost.all
puts

puts "Checking associations"
puts "User..."
p user.posts
p user.comments
puts 'Post...'
p post.users
p post.comments
p post.category
p post.tags

puts 'Comment...'
p comment.user
p comment.post

puts 'Tag...'
p tag.posts

puts 'Category...'
p category.posts

puts
puts 'Set a comment to belong to a different user'
p comment.user_id
comment.user = User.last
comment.save
p comment.user_id

puts "Set a collection of comments to replace a user's current comments"
p user.comments
user.comments = [Comment.first, Comment.last]
user.save
p user.comments
puts "Set a comment's author to be a different user"
puts "Return a given comment's author"
