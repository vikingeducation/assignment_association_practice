# List all Users, Comments, Posts, Categories or Tags.
User.all
Comment.all
Post.all
Category.all
Tag.all

# List a given user's comments
User.first.comments

# Set a comment to belong to a different user
c = Comment.all.sample
new_user = c.build_user(:name => "foo")
new_user.save

c = Comment.first # user_id: 4
c.author_id = User.find(19)
c.save
# User.first.authored_comments.build

# Set a post to be in a different category
p = Post.all.sample
ct = Category.all.sample
p.category_id = ct.id

# Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
user_c = User.first.authored_comments
new_comments = [Comment.all.sample, Comment.all.sample]
User.first.authored_comments.each {|c| c.user_id = nil; c.save }
User.first.authored_comments = new_comments

# Return a given comment's author
Comment.first.user

# List a given post's comments
Post.first.comments

# Return a given comment's parent post
Comment.first.post

# Remove one post from a category's collection of posts
cat = Category.first.posts
cat.delete(Category.first.posts.first)

# List the posts authored by a given user
User.first.authored_posts

# List the IDs of all posts authored by a given user (hint: there's an association method for this)
u = User.first.authored_posts.ids

# Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
User.first.authored_posts = [Post.all.first, Post.all.second]

# List the authors of a given post
Post.first.authors

# Set a collection of Users to replace a given Post's authors in a similar way
Post.first.authors = [User.first, User.second]

# Accomplish the same thing by only using IDs (hint: there's an association method for this...)
Post.first.authors.ids = [1,2]

# List the posts under a given tag
Post.first.tags

# Add a new post to a given tag by only using its ID
Tag.first.posts << Post.find(3)
 
# Add a new tag to a given post by only using its ID
Post.first.tags << Tag.find(1)

# List the tags on a given post
Post.first.tags
