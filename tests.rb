# List all Users, Comments, Posts, Categories or Tags.
p User.all
p Post.all
p Comment.all
p Category.all
p Tag.all

# List a given user's comments
p Comment.first

# Set a comment to belong to a different user
p comment = Comment.first
comment.user = User.all.sample
comment.save
p Comment.first

# Set a post to be in a different category
p post = Post.first
post.category = Category.all.sample
post.save
p Post.first

# Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
p com = User.first
com.comments = [Comment.all.sample, Comment.all.sample, Comment.all.sample]
com.save
p User.first.comments

# Return a given comment's author
p Comment.first.user

# List a given post's comments
p Post.first.comments

# Return a given comment's parent post
p Comment.second.post

# Remove one post from a category's collection of posts
p cp = Category.first.posts.first
cp.destroy
p Category.first.posts

# List the posts authored by a given user
p u = User.find(8).posts

# List the IDs of all posts authored by a given user (hint: there's an association method for this)
p User.find(8).post_ids

# Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
p User.find(3)
u = User.find(3)
u.posts = [Post.all.sample, Post.all.sample]
u.save
p User.find(3).posts

# List the authors of a given post
p Post.first.users

# Set a collection of Users to replace a given Post's authors in a similar way
post = Post.first
p post.users
post.users = [User.all.sample, User.all.sample]
post.save
p Post.first.users

# Accomplish the same thing by only using IDs (hint: there's an association method for this...)
post = Post.first
p post.user_ids
post.user_ids = [User.all.pluck(:id).sample, User.all.pluck(:id).sample]
post.save
p Post.first.user_ids

# List the posts under a given tag
p Tag.first.posts

# Add a new post to a given tag by only using its ID
p t = Tag.first.posts
new_post = t.create(title: 'New title', body: 'New body')
p Tag.first.posts

# Add a new tag to a given post by only using its ID
p post  = Post.first.tags
new_tag = post.create(name: 'New Tag')
p Post.first.tags.reload

# List the tags on a given post
p Post.first.tags
