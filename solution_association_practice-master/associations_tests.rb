# ----------------------------------------
# Basic Associations and Renaming
# ----------------------------------------

Hirb.enable

$num = 0
def problem(str)
  2.times { puts }
  puts '*' * str.length
  puts
  puts "#{$num += 1}. #{str}"
  puts
  puts '*' * str.length
  2.times { puts }
end


problem("List all Users, Comments, Posts, Categories or Tags.")
User.all
Comment.all
Post.all
Category.all
Tag.all


problem("List a given user's comments")
User.first.authored_comments


problem("Set a comment to belong to a different user")
comment = Comment.first
old_user = comment.author
new_user = User.where('id != ?', old_user.id).first
comment.author = new_user
comment.author = old_user
comment.save



problem("Set a post to be in a different category")
post = Post.first
old_category = post.category
new_category = Category.where('id != ?', old_category.id).first
post.category = new_category
post.category = old_category


problem(%Q;Set a collection of comments to replace a user's current comments
  (e.g. User.first.comments = [Comment.first, Comment.second]);)
user = Comment.first.author
comments = user.authored_comments
old_user = comments.first.author
new_user = User.where('id != ?', user.id).first
comments = new_user.authored_comments
comments = old_user.authored_comments


problem("Set a comment's author to be a different user")
comment = Comment.all.sample
new_user = User.all.sample
old_user = comment.author
comment.author = new_user
comment.author = old_user


problem("Return a given comment's author")
Comment.all.sample.author


problem("List a given post's comments")
Post.find(Comment.group('post_id').count('post_id').max[0]).comments


problem("Return a given comment's parent post")
Comment.first.parent_post


problem("Remove one post from a category's collection of posts")
category = Category.first
post = category.posts.first
category.posts.delete(post)
category.posts
category.posts << post
category.posts


problem("List the posts authored by a given user")
User.first.authored_posts


problem("List the IDs of all posts authored by a given user (hint: there's an association method for this)")
User.first.authored_post_ids


problem(%Q;Set a collection of Posts to replace that user's
  currently authored posts,
  e.g. User.first.posts = [Post.first, Post.second];)
user_one = User.first
user_two = User.last
post_ids_one = user_one.authored_post_ids
post_ids_two = user_two.authored_post_ids
user_one.authored_post_ids = post_ids_two
user_two.authored_post_ids = post_ids_one
user_one.authored_posts
user_two.authored_posts


problem("List the authors of a given post")
Post.first.authors


problem("Set a collection of Users to replace a given Post's authors in a similar way")
post = Post.first
post.authors = User.all


problem("Accomplish the same thing by only using IDs (hint: there's an association method for this...)")
post_one = Post.first
post_two = Post.last
author_ids_one = post_one.author_ids
author_ids_two = post_two.author_ids
post_one.author_ids = author_ids_two
post_two.author_ids = author_ids_one


problem("List the posts under a given tag")
Tag.first.tagged_posts


problem("Add a new post to a given tag by only using its ID")
tag = Tag.first
post = Post.first
tag.update!(:tagged_post_ids => tag.tagged_post_ids << post.id)


problem("Add a new tag to a given post by only using its ID")
post = Post.last
tag = Tag.last
post.update!(:tag_ids => post.tag_ids << tag.id)


problem("List the tags on a given post")
Post.first.tags








