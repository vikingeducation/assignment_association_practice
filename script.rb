# List all Users, Comments, Posts, Categories or Tags.
User.all, Comment.all, Post.all, Category.all, Tag.all

# List a given user's comments
User.first.comments

# Set a comment to belong to a different user
  u = User.first
  c = Comment.first
  c.user = u

# Set a post to be in a different category
  c = Category.first
  p = Post.first
  p.category = c

# Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
  u = User.first
  u.comments = [Comment.first, Comment.last]

# Return a given comment's author
  Comment.last.author

# Return a given comment's parent post
  Comment.first.post

# Remove one post from a category's collection of posts
  Category.first.posts.destroy(Category.first.posts.first)

# List the posts authored by a given user
  User.first.posts

# List the IDs of all posts authored by a given user (hint: there's an association method for this)
  User.first.post_ids

# Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
  User.first.posts = [Post.first, Post.last]

# List the authors of a given post
  Post.first.users

# Set a collection of Users to replace a given Post's authors in a similar way
  Post.first.users = [User.first, User.last]

# Accomplish the same thing by only using IDs (hint: there's an association method for this...)
  Post.first.user_ids = [User.first, User.last]

# List the posts under a given tag
  Tag.first.posts

# Add a new post to a given tag by only using its ID
  Tag.first.posts << Post.find(1)

# Add a new tag to a given post by only using its ID
  Post.first.tags << Tag.find(1)

# List the tags on a given post
  Post.first.tags
