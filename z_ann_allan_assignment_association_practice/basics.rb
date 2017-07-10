#1. List all users, comments, posts, categories, or tags
User.all
Post.all
Comment.all
Category.all
Tag.all
#2.  List a given user's comments
u = User.first
u.comments
#3. Set a comment to belong to a different user
c = Comment.find(100) #user_id = 6
c.user_id = 1
#4. Set a post to be in a different Category
p = Post.find(50) #cat = 4
p.category_id = 1
#5. Set a collection of comments to replace a user's current comments
User.first.comments = [Comment.first, Comment.second]
#6.  Return a given comments author
Comment.first.user
#7. List a given post's comments
Post.first.comments
#8. Return a given comment's parent post
Comment.first.post
#9. Remove one post from a category's collection of posts
Category.first.posts.delete(Category.first.posts.last)
#10. List the posts authored by a given user
User.first.posts
#11. List the IDs of all the posts authored by a given user
User.first.post_ids
#12. Set a collectionof Posts to replace that user's currently authored posts
User.first.posts = [Post.first, Post.second]
#13. List the authors of a given post
Post.first.users
#14. Set a collection of users to replace a given Post's authors in a similar way
Post.first.users = [User.first, User.second]
#15 Accomplish the same thing by only using IDs
Post.first.users = [1,2]
#16. List the posts under a given tag
Tag.first.posts
#17. Add a new post to a given tag by only using its ID
Tag.first.posts << Post.find(3)
#18. Add a new tag to a given post by only using its ID
Post.first.tags << Tag.find(3)
#19. List the tags on a given post
Post.first.tags
