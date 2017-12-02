# 1.	List all Users, Comments, Posts, Categories or Tags.
User.all
Comment.all
Post.all
Category.all
Tag.all
# 2.	List a given user's comments
u = User.all.first
u.comments
# 3.	Set a comment to belong to a different user
u = User.find(127)
c = u.comments.first
c.user_id = 123
# 4.	Set a post to be in a different category
post = Post.all.sample
post.category_id = Category.all.sample.id
# 5.	Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])

# 6.	Return a given comment's author
c = Comment.all.sample
c.user.name
# 7.	List a given post's comments
post = Post.find(67)
post.comments.all
# 8.	Return a given comment's parent post

# 9.	Remove one post from a category's collection of posts
# 10.	List the posts authored by a given user
# 11.	List the IDs of all posts authored by a given user (hint: there's an association method for this)
# 12.	Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
# 13.	List the authors of a given post
# 14.	Set a collection of Users to replace a given Post's authors in a similar way
# 15.	Accomplish the same thing by only using IDs (hint: there's an association method for this...)
# 16.	List the posts under a given tag
# 17.	Add a new post to a given tag by only using its ID
# 18.	Add a new tag to a given post by only using its ID
# 19.	List the tags on a given post
