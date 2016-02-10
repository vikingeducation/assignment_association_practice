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
user.posts.ids

#Set a collection of Posts to replace that user's currently authored posts

user.posts = [Post.find(2), Post.find(3)]

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

#Set a collection of Users to replace a given Post's authors in a similar way
post.users = [User.find(2), User.find(3)]

#Now use ids
user.post_ids = [2,3,4]

#List the authors of a given post
post.users

#Add a new tag to a given post by only using its ID
post.tags << 2

#List the tags on a given post
post.tags

puts 'Category'
category = Category.find(2)

#Remove one post from a category's collection of posts
category.posts.first.destroy
category.posts.find(id).destroy

puts 'Tag Relations'
tag = Tag.find(2)

#List the posts under a given tag
tag.posts

#Add a new post to a given tag by only using its ID
tag.post_ids << 4