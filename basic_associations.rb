# List all Users, Comments, Posts, Categories or Tags.
User.all
Comment.all
Post.all
Category.all
Tag.all

# List a given user's comments
User.first.authored_comments

# Set a comment to belong to a different user
User.first.authored_comments << Comment.all.sample

# Set a post to be in a different category
Post.first.category = Category.all.sample

# Set a collection of comments to replace a user's current comments (e.g.
# User.first.comments = [Comment.first, Comment.second])
User.first.authored_comments = [Comment.first, Comment.second]

# Return a given comment's author
Comment.first.author

# List a given post's comments
Post.first.comments

# Return a given comment's parent post
Comment.first.parent_post

# Remove one post from a category's collection of posts
Category.first.posts.destroy(Category.first.posts.first)

# List the posts authored by a given user
User.first.authored_posts

# List the IDs of all posts authored by a given user (hint: there's an
# association method for this)
User.first.authored_post_ids

# Set a collection of Posts to replace that user's currently authored posts,
# e.g. User.first.posts = [Post.first, Post.second]
User.first.authored_posts = Post.all[0..10]

# List the authors of a given post
Post.first.authors

# Set a collection of Users to replace a given Post's authors in a similar way
Post.first.authors = User.all[0..3]

# Accomplish the same thing by only using IDs (hint: there's an association
# method for this...)
Post.first.author_ids = User.ids[0..1]

# List the posts under a given tag
Tag.first.post_taggings

# Add a new post to a given tag by only using its ID
Tag.first.post_tagging_ids << Post.first.id

# Add a new tag to a given post by only using its ID
Post.first.post_taggings << Tag.first.id

# List the tags on a given post
Post.first.post_taggings
