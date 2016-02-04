namespace :verify do
  desc "TODO"
  task db: :environment do

  p "List all Users, Comments, Posts, Categories or Tags."
  p User.all
  p Comment.all
  p Post.all
  p Category.all
  p Tag.all

  p "List a given user's comments"
  User.find(3).comments

  p "Set a comment to belong to a different user"
  Comment.find(4).update(user: User.all.sample)

  p "Set a post to be in a different category"
  p "first category: #{Post.find(6).category}"
  pt = Post.find(6)
  pt.category = Category.all.sample
  pt.save
  p "second category: #{pt.category}"

  p "Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])"
  p User.first.comments = [Comment.first, Comment.second]
  
  p "Set a comment's author to be a different user"
  p Comment.first.update(user: User.all.sample)

  p "Return a given comment's author"
  p Comment.all.sample.user

  p "List a given post's comments"
  Post.find(8).comments

  p "Return a given comment's parent post"
  Comment.all.sample.post

  p "Remove one post from a category's collection of posts"
  post = Category.first.posts.first
  p "post before: #{post}"
  Category.first.posts.delete(post)
  p "post after: #{post}"

  p "List the posts authored by a given user"
  p User.all.sample.posts

  p "List the IDs of all posts authored by a given user (hint: there's an association method for this)"
  p User.first.post_ids

  p" Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]"
  p User.find(3).posts = [Post.first, Post.second]

  p "List the authors of a given post"
  p Post.all.sample.users

  p "Set a collection of Users to replace a given Post's authors in a similar way" 
  p Post.all.sample.users = [User.first, User.second]

  p "Accomplish the same thing by only using IDs (hint: there's an association method for this...)"
  p Post.find(2).user_ids = Post.find(3).user_ids

  p "List the posts under a given tag"
  p Tag.find(3).posts

  p "Add a new post to a given tag by only using its ID"
  tag = Tag.find(4)
  p "before: #{tag.posts}" 
  tag.post_ids += [17]
  p "after #{tag.posts}"

  p "Add a new tag to a given post by only using its ID"
  post = Post.first
  post.tag_ids += [9]
  post.tags

  p "List the tags on a given post"
  p Post.find(9).tags


  end

end
