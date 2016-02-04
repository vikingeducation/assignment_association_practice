#testingfile

#Basic Output
puts 'Users'
User.all

puts 'Posts'
Post.all

puts 'Categories'
Category.all

puts 'Tags'
Tag.all

puts 'Comments'
Comment.all

#Relations

puts 'User Relations'
user = User.find(1)
user.comments
user.posts

puts 'Comment Relations'
comment = Comment.find(2)
comment.post
comment.user

puts 'Post Relations'
post = Post.find(2)
post.comments
post.category
post.users
post.tags

puts 'Tag Relations'
tag = Tag.find(2)
tag.posts