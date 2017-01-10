# List all Users, Comments, Posts, Categories or Tags.

User.all
Comment.all
Post.all
Category.all
Tag.all


# List a given user's comments

u = User.first
u.comments


# Set a comment to belong to a different user

c = Comment.first
c.user
new_user = User.all.sample
c.user = new_user


# Set a post to be in a different category

p = Post.first
p.category
new_category = Category.all.sample
p.category = new_category


# Set a collection of comments to replace a user's current comments (
new_comments = [ Comment.all.sample, Comment.all.sample ]
u = User.first
u.comments = new_comments


# Return a given comment's author

c = Comment.all.sample
c.user


# List a given post's comments

p = Post.all.sample
p.comments


# Return a given comment's parent post

c = Comment.all.sample
c.post

# Remove one post from a category's collection of posts

u.posts.delete(u.posts.last)

# List the posts authored by a given user

u.posts

# List the IDs of all posts authored by a given user (hint: there's an association method for this)

u.post_ids

# Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]

new_posts = [Post.all.sample, Post.all.sample]
u.posts = new_posts

# List the authors of a given post

p = Post.first
p.users

# Set a collection of Users to replace a given Post's authors in a similar way

new_users = [ User.all.sample, User.all.sample ]
p.users = new_users

# Accomplish the same thing by only using IDs (hint: there's an association method for this...)

new_users = [ User.all.sample.id, User.all.sample.id ]
p.user_ids = new_users

# List the posts under a given tag

t = Tag.all.sample
t.posts

# Add a new post to a given tag by only using its ID

p = Post.all.sample.id
t.posts << Post.find(15)

# Add a new tag to a given post by only using its ID

p.tags.create(id: 10000)

# List the tags on a given post

p.tags
