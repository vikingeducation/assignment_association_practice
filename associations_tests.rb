# /check_relations.rb

# 1. List all Users, Comments, Posts, Categories or Tags.
puts "Listing all users..."
User.all
puts "Listing all comments..."
Comment.all
puts "Listing all posts..."
Post.all
puts "Listing all categories..."
Category.all
puts "Listing all tags..."
Tag.all

# 2.List a given user's comments
puts "Listing first user's comments..."
User.first.comments

# 3. Set a comment to belong to a different user
puts "Set first comment to belong to a different user"
Comment.first.user = User.all.sample

# 4. Set a post to be in a different category
puts "Reset category of first post"
Post.first.update(:category => Category.all.sample)

# 5. Set a collection of comments to replace a user's current comments
# (e.g. User.first.comments = [Comment.first, Comment.second]
comments = [Comment.all.sample, Comment.all.sample] 
User.first.comments = comments

# 6. Return a given comment's author
comment = Comment.all.sample
comment.user

# 7. List a given post's comments
post = Post.all.sample
post.comments

# 8. Return a given comment's parent post
comment = Comment.all.sample
comment.post

# 9. Remove one post from a category's collection of posts
selection = Category.first.posts
selection.delete(selection.sample)

# 10. List the posts authored by a given user
user = User.all.sample
user.posts

# 11. List the IDs of all posts authored by a given user
# (hint: there's an association method for this)
user = User.all.sample
user.post_ids

