# a user's comments should be more semantic
User.first.authored_comments
Comment.first.author

  #

# post authorship should be semantic too
User.first.authored_posts
Post.first.authors

# join table
User.first.post_authorings #
Post.first.post_authorings

# post comments
Post.first.comments     # No change
Comment.first.parent_post

# tags
Tag.first.tagged_posts   
Post.first.tags         # No change

# The tag join table
Tag.first.post_taggings # @
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