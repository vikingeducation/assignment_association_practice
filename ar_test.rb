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
p = Post.first.category = Category.first
p.category = Category.first
p.save

# Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
User.first.authored_comments = [Comment.first, Comment.second]

# Return a given comment's author
Comment.last.author

# List a given post's comments
Post.first.comments

# Return a given comment's parent post
Comment.last.parent_post

# Remove one post from a category's collection of posts
Category.first.posts.first.destroy

# List the posts authored by a given user
User.first.authored_posts

# List the IDs of all posts authored by a given user (hint: there's an association method for this)
User.first.authored_post_ids

# Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
User.first.authored_posts = [Post.fifth, Post.last]

# List the authors of a given post
Post.last.authors

# Set a collection of Users to replace a given Post's authors in a similar way
Post.last.authors = [User.last, User.fifth]

# Accomplish the same thing by only using IDs (hint: there's an association method for this...)
Post.last.author_ids = [1, 2]

# List the posts under a given tag
Tag.first.tagged_posts

# Add a new post to a given tag by only using its ID
Tag.first.tagged_posts << Post.last

# Add a new tag to a given post by only using its ID
Tag.first.tagged_post_ids << Post.fifth.ID

# List the tags on a given post
Post.last.tags

# a user's comments should be more semantic
User.first.authored_comments
Comment.first.author

# post authorship should be semantic too
User.first.authored_posts
Post.first.authors

# join table
User.first.post_authorings
Post.first.post_authorings

# post comments
Post.first.comments     # No change
Comment.first.parent_post

# tags
Tag.first.tagged_posts
Post.first.tags         # No change

# The tag join table
Tag.first.post_taggings
Post.first.post_taggings

# Let's add a NEW association that chains even more
# First, for a given user, return the collection of
#   tags on every post that user has authored
# NOTE: This is done via associations ONLY, not custom methods
User.first.tags_on_authored_posts

# Now do the same in reverse...
#   return all the authors of posts a given
#   tag has been associated with
Tag.first.authors_of_tagged_posts





# Set a comment to belong to a different user

