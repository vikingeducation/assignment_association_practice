=begin
  The Basics

  Verify that you can retrieve or do the following, which represent both sides of each association:

  You may want to put this into a script file in your Rails root directory since these will come in handy as a set of integration tests every time you make a change!

  List all Users, Comments, Posts, Categories or Tags.
  List a given user's comments
  Set a comment to belong to a different user
  Set a post to be in a different category
  Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
  Return a given comment's author
  List a given post's comments
  Return a given comment's parent post
  Remove one post from a category's collection of posts
  List the posts authored by a given user
  List the IDs of all posts authored by a given user (hint: there's an association method for this)
  Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
  List the authors of a given post
  Set a collection of Users to replace a given Post's authors in a similar way
  Accomplish the same thing by only using IDs (hint: there's an association method for this...)
  List the posts under a given tag
  Add a new post to a given tag by only using its ID
  Add a new tag to a given post by only using its ID
  List the tags on a given post
=end

# 1. List all Users, Comments, Posts, Categories or Tags.
User.all
Comment.all
Post.all
Category.all
Tag.all

#2. List a given user's comments
User.first.comments

#3. Set a comment to belong to a different user
Comment.first.user = User.first

#4. Set a post to be in a different category
Post.first.category = Category.first

#5. Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
User.first.comments = [Comment.first, Comment.second]

#6. Return a given comment's author
Comment.first.user

#7. List a given post's comments
Post.first.comments

#8. Return a given comment's parent post
Comment.first.post

#9. Remove one post from a category's collection of posts
Category.first.posts.delete(Post.where(:id => Category.first.posts.ids.sample))

#10. List the posts authored by a given user
User.first.posts

#11. List the IDs of all posts authored by a given user (hint: there's an association method for this)
User.first.post_ids

#12. Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
User.first.posts = [Post.first, Post.second]

#13. List the authors of a given post
Post.first.users

#14. Set a collection of Users to replace a given Post's authors in a similar way
Post.first.users = [User.first, User.second]

#15. Accomplish the same thing by only using IDs (hint: there's an association method for this...)
Post.first.user_ids = [User.all.ids.sample, User.all.ids.sample]

#16. List the posts under a given tag
Tag.first.posts

#17. Add a new post to a given tag by only using its ID
Tag.first.posts << Post.find(Post.all.ids.sample)

#18. Add a new tag to a given post by only using its ID
Post.first.tags << Tag.find(Tag.all.ids.sample)

#19. List the tags on a given post
Post.first.tags







