# a user's comments should be more semantic
puts "1"
p User.first.authored_comments
puts "2"
p Comment.first.author
puts "3"
# post authorship should be semantic too
p User.first.authored_posts
puts "4"
p Post.first.authors
puts "5"
# join table
p User.first.post_authorings
puts "6"
p Post.first.post_authorings
puts "7"
# post comments
p Post.first.comments     # No change
puts "8"
p Comment.first.parent_post

puts "9"
# tags
p Tag.find(19).tagged_posts
puts ""
Post.first.tags         # No change
puts ""
# The tag join table
p Tag.first.post_taggings
puts "10"
p Post.first.post_taggings
puts "11"
# Let's add a NEW association that chains even more
# First, for a given user, return the collection of
#   tags on every post that user has authored
# NOTE: This is done via associations ONLY, not custom methods
p User.first.tags_on_authored_posts
puts "12"
# Now do the same in reverse...
#   return all the authors of posts a given
#   tag has been associated with
p Tag.find(19).authors_of_tagged_posts
