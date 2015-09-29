# Run this file in `rails c` via `load 'tests.rb'`

# List all Users, Comments, Posts, Categories or Tags.
User.all
Comment.all
Post.all
Category.all
Tag.all

# List a given user's comments
User.first.authored_comments

# Set a comment to belong to a different user
comment = Comment.first
old_user = comment.author
new_user = User.where('id != ?', old_user.id).first
comment.author = new_user
comment.author = old_user


# Set a post to be in a different category
post = Post.first
old_category = post.category
new_category = Category.where('id != ?', old_category.id).first
post.category = new_category
post.category = old_category

# Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
comments = Comment.all.where('user_id = 1')
old_user = comments.first.author
new_user = User.where('id != 1').first
comments = new_user.authored_comments
comments = old_user.authored_comments

# Set a comment's author to be a different user
comment = Comment.all.sample
new_user = User.all.sample
old_user = comment.author
comment.author = new_user
comment.author = old_user

# Return a given comment's author
Comment.all.sample.author

# List a given post's comments
Post.find(Comment.group('post_id').count('post_id').max[0]).comments

# Return a given comment's parent post
Comment.first.parent_post

# Remove one post from a category's collection of posts
category = Category.first
post = category.posts.first
category.posts.delete(post)
category.posts
category.posts << post
category.posts

# List the posts authored by a given user
User.first.authored_posts

# List the IDs of all posts authored by a given user (hint: there's an association method for this)
User.first.authored_post_ids

# Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
user_one = User.first
user_two = User.last
post_ids_one = user_one.authored_post_ids
post_ids_two = user_two.authored_post_ids
user_one.authored_post_ids = post_ids_two
user_two.authored_post_ids = post_ids_one
user_one.authored_posts
user_two.authored_posts

# List the authors of a given post
Post.first.authors

# Set a collection of Users to replace a given Post's authors in a similar way
post = Post.first
post.authors = User.all

# Accomplish the same thing by only using IDs (hint: there's an association method for this...)
post_one = Post.first
post_two = Post.last
author_ids_one = post_one.author_ids
author_ids_two = post_two.author_ids
post_one.author_ids = author_ids_two
post_two.author_ids = author_ids_one

# List the posts under a given tag
Tag.first.tagged_posts

# Add a new post to a given tag by only using its ID
tag = Tag.first
post = Post.first
tag.tagged_post_ids << post.id

# Add a new tag to a given post by only using its ID
post = Post.last
tag = Tag.last
post.tag_ids << tag.id

# List the tags on a given post
Post.first.tags








