# List all Users, Comments, Posts, Categories or Tags.
User.all
Comment.all
Post.all
Category.all
Tag.all

# List a given user's comments
User.first.comments

# Set a comment to belong to a different user
User.first.comments << Comment.all.sample

# Set a post to be in a different category
Post.first.category = Category.all.sample

# Set a collection of comments to replace a user's current comments (e.g.
# User.first.comments = [Comment.first, Comment.second])
User.first.comments = [Comment.first, Comment.second]

# Return a given comment's author
Comment.first.user

# List a given post's comments
Post.first.comments

# Return a given comment's parent post
Comment.first.post

# Remove one post from a category's collection of posts
Category.first.posts.destroy(Category.first.posts.first)

# List the posts authored by a given user
User.first.posts

# List the IDs of all posts authored by a given user (hint: there's an
# association method for this)
User.first.post_ids

# Set a collection of Posts to replace that user's currently authored posts,
# e.g. User.first.posts = [Post.first, Post.second]
User.first.posts = Post.all[0..10]

# List the authors of a given post
Post.first.users

# Set a collection of Users to replace a given Post's authors in a similar way
Post.first.users = User.all[0..3]

# Accomplish the same thing by only using IDs (hint: there's an association
# method for this...)
Post.first.user_ids = User.ids[0..1]

# List the posts under a given tag
Tag.first.posts

# Add a new post to a given tag by only using its ID
Tag.first.post_ids << Post.first.id

# Add a new tag to a given post by only using its ID
Post.first.tags << Tag.first.id

# List the tags on a given post
Post.first.tags
