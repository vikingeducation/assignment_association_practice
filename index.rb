# Helper Functions

Hirb.enable

def banner(str)
  2.times { puts }
  puts '*' * str.length
  puts
  puts str
  puts
  puts '*' * str.length
  2.times { puts }
end

def hirb_puts(records)
  puts Hirb::Helpers::AutoTable.render(records)
end



# The Basics



banner "1. List all Users, Comments, Posts, Categories or Tags."

hirb_puts User.all
hirb_puts Comment.all
hirb_puts Post.all
hirb_puts Category.all
hirb_puts Tag.all


banner "2. List a given user's comments"

hirb_puts User.first.authored_comments


puts "3. Set a comment to belong to a different user"



# 1. Set a post to be in a different category

# 1. Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])

# 1. Set a comment's author to be a different user

# 1. Return a given comment's author

# 1. List a given post's comments

# 1. Return a given comment's parent post

# 1. Remove one post from a category's collection of posts

# 1. List the posts authored by a given user

# 1. List the IDs of all posts authored by a given user (hint: there's an association method for this)

# 1. Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]

# 1. List the authors of a given post

# 1. Set a collection of Users to replace a given Post's authors in a similar way

# 1. Accomplish the same thing by only using IDs (hint: there's an association method for this...)

# 1. List the posts under a given tag

# 1. Add a new post to a given tag by only using its ID

# 1. Add a new tag to a given post by only using its ID

# 1. List the tags on a given post



