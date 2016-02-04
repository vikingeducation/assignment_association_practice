#testingfile

#Basic Output
puts 'Users'
print User.all

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

#Set a collection of comments to replace a user's current comments 
user.comments = [Comment.find(3), Comment.find(4)]
#user.comments = [Comment.first, Comment.second]

#List the posts authored by a given user
user.posts

#List the IDs of all posts authored by a given user 
user.posts_ids

puts 'Comment Relations'
comment = Comment.find(2)
comment.post
comment.user

#Set comment user to a different user
comment.user = User.find(2)

#Return a given comment's author
comment.user

#Return a given comment's parent post
comment.post

puts 'Post Relations'
post = Post.find(2)
post.comments
post.category
post.users
post.tags

#Set post to a different category
post.category = Category.find(2)

#List a given post's comments
post.comments


puts 'Category'
category = Category.find(2)

#Remove one post from a category's collection of posts
category.posts.first.destroy
category.posts.find(id).destroy

puts 'Tag Relations'
tag = Tag.find(2)
tag.posts