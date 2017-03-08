## List all Users, Comments, Posts, Categories, or Tags
users = User.all
comments = Comment.all
posts = Post.all
categories = Category.all
tags = Tag.all

## List a given user's comments
users.sample.comments

# Set a comment to belong to a different user
# comments.sample.update(user: users.sample)
# 

# Set a post to be in a different category
# 

# Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
users.sample.comments = [comments.sample, comments.sample]

# Return a given comment's author
comments.sample.user

# List a given post's comments
posts.sample.comments

# Return a given comment's parent post
comments.sample.post

# Remove one post from a category's collection of posts
categories.sample.posts.sample.delete

# List the posts authored by a given user
users.sample.posts

# List the IDs of all posts authored by a given user (hint: there's an association method for this)
users.sample.post_ids

# Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
users.sample.posts = [posts.sample, posts.sample]

# List the authors of a given post
posts.sample.users

# Set a collection of Users to replace a given Post's authors in a similar way
posts.sample.users = [users.sample, users.sample]

# Accomplish the same thing by only using IDs (hint: there's an association method for this...)
posts.sample.user_ids = [users.sample.id, users.sample.id]

# List the posts under a given tag
tags.sample.posts

# Add a new post to a given tag by only using its ID
tags.sample.posts << posts.sample

# Add a new tag to a given post by only using its ID
posts.sample.tags << tags.sample

# List the tags on a given post
posts.sample.tags
