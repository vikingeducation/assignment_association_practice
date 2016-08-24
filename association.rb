# List all Users, Comments, Posts, Categories or Tags.
User.all
Comment.all
Post.all
Category.all

# List a given user's comments
User.first.comments

# Set a comment to belong to a different user
c = Comment.first
c.user = User.first
c.save

# Set a post to be in a different category
p = Post.first
p.category = Category.find(1)
p.save

# Set a collection of comments to replace a
# user's current comments (e.g. User.first.
# comments = [Comment.first, Comment.second])
# The step will make the old comments the user_id to be null
u = User.find(2)
u.comments = [Comment.first, Comment.second]

# Return a given comment's author
Comment.first.user

# List a given post's comments
Post.first.comments

# Return a given comment's parent post
Comment.last.post

# Remove one post from a category's collection of posts
c = Category.first
c.posts.first.destroy

# List the posts authored by a given user
u = User.last
u.posts

# List the IDs of all posts authored by a
# given user (hint: there's an association
# method for this)
u = User.first
u.posts.pluck(:id)

# Set a collection of Posts to replace that
# user's currently authored posts
u = User.last
u.posts = Post.all[1..10]

# List the authors of a given post
p = Post.last
p.users

# Set a collection of Users to replace a given
# Post's authors in a similar way
p = Post.last
p.users = [User.first, User.last]

# Accomplish the same thing by only using IDs
# (hint: there's an association method for this...)
p = Post.last
p.user_ids = [3, 4]

# List the posts under a given tag
t = Tag.last
t.posts

# Add a new post to a given tag by only using its ID
t = Tag.find(5)
t.posts.create(category_id: 1, title: "hello", body: "lalalalalalalalalala")

# Add a new tag to a given post by only using its ID
p = Post.find(6)
p.tags.create(name: "mother fucker")

# List the tags on a given post
Post.last.tags
