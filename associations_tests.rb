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

# 12. Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
posts = [Post.all.sample, Post.all.sample]
user = User.all.sample
user.posts = posts

#13. List the authors of a given post
p = Post.all.sample
p.users

# 14. Set a collection of Users to replace a given Post's authors in a similar way
user_list = [User.all.sample, User.all.sample]
p = Post.all.sample
p.users = user_list

# 15. Accomplish the same thing by only using IDs (hint: there's an association method for this...)
user_id_list = [User.all.sample.id, User.all.sample.id]
p = Post.all.sample
p.user_ids = user_id_list

# 16. List the posts under a given tag
t = Tag.all.sample
t.posts

#17. Add a new post to a given tag by only using its ID
t = Tag.all.sample
p = Post.all.sample
new_post_ids = t.post_ids << p.id
t.post_ids = new_ids

#18. Add a new tag to a given post by only using its ID
p = Post.all.sample
t = Tag.all.sample
new_tag_ids = p.tag_ids << t.id
p.tag_ids = new_tag_ids

#19. List the tags on a given post
p = Post.all.sample
p.tags













