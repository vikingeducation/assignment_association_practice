# List all Users, Comments, Posts, Categories or Tags.
User.all
Comment.all
Post.all
Category.all
Tag.all

# List a given user's comments
User.find_by_name("Rod Bashirian").authored_comments

# Set a comment to belong to a different user
c = Comment.first
c.author = User.first
c.save

# Set a post to be in a different category
p = Post.first
p.category = Category.first
p.save

# Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
# Return a given comment's author
# List a given post's comments
# Return a given comment's parent post
# Remove one post from a category's collection of posts
# List the posts authored by a given user
# List the IDs of all posts authored by a given user (hint: there's an association method for this)
# Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
# List the authors of a given post
# Set a collection of Users to replace a given Post's authors in a similar way
# Accomplish the same thing by only using IDs (hint: there's an association method for this...)
# List the posts under a given tag
# Add a new post to a given tag by only using its ID
# Add a new tag to a given post by only using its ID
# List the tags on a given post






# Set a comment to belong to a different user

