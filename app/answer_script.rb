1. List all
  a. Users
    - User.all
  b. Comments
    - Comment.all
  c. Posts
    - Post.all
  d. Categories
    - Category.all
  e. Tags
    - Tag.all

2. List a given user's comments
  - User.find(id).posts

3. Set a comment to belong to a different user
  - Comment.find(id).user = new_user.id

4. Set a post to be in a different category
  - Post.find(id).category = new_cat.id

5. Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
  - new_comments = [comment1, comment1, etc.]
  - User.find(id).comments = new_comments

6. Return a given comment's author
  - Comment.first.user

7. List a given post's comments
  - Post.find(id).comments

8. Return a given comment's parent post
  - Comment.find(id).post

9. Remove one post from a category's collection of posts
  - Category.find(id).posts.delete(object1)

10.List the posts authored by a given user
  - User.find(id).posts

11.List the IDs of all posts authored by a given user (hint: there's an association method for this)
  - User.find(id).posts.pluck(:id)

12.Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]
  - new_posts = [Post.all.sample, Post.all.sample, Post.all.sample]
  - User.find(id).posts = new_posts

13.List the authors of a given post
  - Post.find(id).users

14.Set a collection of Users to replace a given Post's authors in a similar way
  - authors = [User.all.sample, User.all.sample, User.all.sample]
  - Post.find(id).users = authors

15.Accomplish the same thing by only using IDs (hint: there's an association method for this...)
  - Post.find(id).user_ids = [3, 5, 2]

16.List the posts under a given tag
  - Tag.find(id).posts

17.Add a new post to a given tag by only using its ID
  - Tag.find(id).posts << Post.find(id)

18.Add a new tag to a given post by only using its ID
  - Post.find(id).tags << Tag.find(id)

19.List the tags on a given post
  - Post.find(id).tags
