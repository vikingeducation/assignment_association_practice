require 'Hirb'

# List all Users, Comments, Posts, Categories or Tags.
Hirb.enable

def hirb_puts( table )
  puts Hirb::Helpers::AutoTable.render table
end

puts "Users are:"
hirb_puts User.all

puts "Comments are:"
hirb_puts Comment.all

puts "Posts are:"
hirb_puts Post.all

puts "Categories are:"
hirb_puts Category.all

puts "Tags are:"
hirb_puts Tag.all

# List a given user's comments
puts "First Users comments are:"
user = User.first
hirb_puts user.comments

puts "Set a comment to belong to a different user"
puts "Before:"
hirb_puts Comment.first.author
puts "After:"
hirb_puts Comment.first.author = User.last

puts "Set a post to be in a different category"
hirb_puts Post.first.category = Category.first

puts "Set a collection of comments to replace a user's current comments"
hirb_puts User.first.comments = [Comment.first, Comment.second]

puts "Return a given comment's author"
hirb_puts Comment.last.author

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
