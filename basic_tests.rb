# List all Users, Comments, Posts, Categories or Tags.
Category.all
User.all
Comment.all
Post.all
Tag.all

# List a given user's comments
User.last.comments

# Set a comment to belong to a different user
def change_comment
  until comment
    comment = User.all.sample.comment[0]
  end
  comment.user_id = rand(User.first.id..User.last.id)
  comment.save!
end

# Set a post to be in a different category
def change_category_for_post
  c = Category.first
  c.post_id =  rand(Post.first.id..Post.last.id)
  c.save!
end

# Set a collection of comments to replace a user's current comments
User.second.comments = [Comment.first, Comment.last]

# Return a given comment's author
Comment.first.user

# List a given post's comments
Post.last.comments

# Return a given comment's parent post
Comment.first.post

# Remove one post from a category's collection of posts
Category.first.posts.first.destroy

# List the posts authored by a given user
User.first.posts

# List the IDs of all posts authored by a given user (hint: there's an association method for this)
User.first.posts.ids

# Set a collection of Posts to replace that user's currently authored posts
User.first.posts = [Post.first, Post.second]

# List the authors of a given post
Post.first.users

# Set a collection of Users to replace a given Post's authors in a similar way
Post.first.users = [User.first, User.second]


#Accomplish the same thing by only using IDs (hint: there's an association method for this...)

Tag.first.post_ids = Post.all.ids

#List the posts under a given tag
Tag.first.posts

#Add a new post to a given tag by only using its ID
Tag.last.posts << Post.find(3)

#Add a new tag to a given post by only using its ID
Post.last.tags << Tag.find(3)

#List the tags on a given post
Post.last.tags

