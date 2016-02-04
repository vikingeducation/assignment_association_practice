#require 'hirb'

Hirb.enable

user = User.first
post = Post.first
comment = Comment.first
tag = Tag.first
category = Category.first

# puts "All the things!"
# p User.all
# p Post.all
# p Category.all
# p Comment.all
# p Tag.all
# p PostTag.all
# p UserPost.all
# puts

# puts "Checking associations"
# puts "User..."
# p user.posts
# p user.comments
# puts 'Post...'
# p post.users
# p post.comments
# p post.category
# p post.tags

# puts 'Comment...'
# p comment.user
# p comment.post

# puts 'Tag...'
# p tag.posts

# puts 'Category...'
# p category.posts

# puts
# puts 'Set a comment to belong to a different user'
# p comment.user_id
# comment.user = User.last
# comment.save
# p comment.user_id

# puts "Set a collection of comments to replace a user's current comments"
# p user.comments
# user.comments = [Comment.first, Comment.last]
# user.save
# p user.comments
# puts "Set a comment's author to be a different user"
# puts "Return a given comment's author"

# puts "Set a comment's author to be a different user"
# puts "SAME as #"

# puts "Return a given comment's author"
# p comment.user.name

# puts "List a given post's comments"
# p post.comments

# puts "Return a given comment's parent post"
# p comment.post

# puts "Remove one post from a category's collection of posts"
# p category.posts
# category.posts.first.destroy
# category.reload
# p category.posts

# puts "List the posts authored by a given user"
# p user.posts

# puts "List the IDs of all posts authored by a given user (hint: there's an association method for this)"

# p user.post_ids

puts "Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]"
p user.first.posts
user.first.posts = [Post.first, Post.second]
user.save
p user.comments

puts "List the authors of a given post"
p "post.user_ids"

puts "Set a collection of Users to replace a given Post's authors in a similar way
Accomplish the same thing by only using IDs (hint: there's an association method for this..)"
p "--------Initial------"
p post.user_ids
p "--------Do Operation------"
p post.user_ids = [User.first.id, User.last.id]
p "--------After------"
p post.user_ids

puts "List the posts under a given tag"
p tag.posts

puts "Add a new post to a given tag by only using its ID"
puts "Add a new tag to a given post by only using its ID"
puts "List the tags on a given post"
