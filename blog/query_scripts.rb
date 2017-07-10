module QueryScript
  
  # 1. List all Users, Comments, Posts, Categories or Tags.

def basic_totals
  User.all
  Comment.all
  Post.all
  Category.all
  Tag.all
end

  # 2. List a given user's comments

def user_comments(user_id)
  User.where("id = ?", user_id).first.comments # this works
end

  # 3. Set a comment to belong to a different user

def set_comment_to_diff_author
  Comment.first.update(author_id: User.last.id) # this works

  Comment.first.update(author_id: Author.last.id) 
    # this works if Author set to child class of User
    # "class Author < User" ... "end"
end

  # 4. Set a post to be in a different category

def set_post_in_diff_category
  post = Post.first
  post.category_id = Category.last.id
  post.save # this works

  # alternate:
  Post.first.update(category_id: Category.last.id) # this works
end

  # 5. Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])

def replace_with_collection_of_comments
  User.first.comments = ([Comment.first, Comment.second, ...])
  User.first.comments = (User.last.comments, User.where(...).first.comments, ...])
  User.first.comments = [Comment.first, Comment.second] # this works
end 

  # 6. Return a given comment's author

def author_of_comment
  Comment.first.author # this works
  Comment.where("id = ?", 11171).first.author # this works
end

  # 7. List a given post's comments

def post_comments
  Post.where("id = ?", 5732).first.comments # this works
  Post.where("id = ?", 5737).first.comments # ditto
end

  # 8. Return a given comment's parent post

def comment_parent_post
  Comment.where("id = ?", 11239).first.post
end

  # 9. Remove one post from a category's collection of posts

def remove_one_category_post
  Category.first.posts.delete(Category.first.posts.last) # this works
end

  # 10. List the posts authored by a given user

def user_collection_of_posts
  User.first.posts # this works
  User.where("users.id = ?", 254).first.posts # this works
  User.where("users.id = ?", 254).first.user_posts # so does this
end

  # 11. List the IDs of all posts authored by a given user (hint: there's an association method for this) ... actually comments are assigned to authors (not posts)

def posts_of_given_author
  User.first.posts.select("id") # this works
  Author.first.comments.select("id") # this works
end

  # 12. Set a collection of Posts to replace that user's currently authored posts, e.g. User.first.posts = [Post.first, Post.second]

def replace_posts_of_user
  User.first.posts = [Post.first, Post.second] # this works
end

  # 13. List the authors of a given post

def authors_of_given_post
  Post.first.users # this works
end

  # 14. Set a collection of Users to replace a given Post's authors in a similar way

def replace_post_authors
  Post.first.users = [User.first, User.second] # this works
  Post.first.authors = [Author.first, Author.second] 
    # this works if Author set to child class of User
    # "class Author < User" ... "end"
end

  # 15. Accomplish the same thing by only using IDs (hint: there's an association method for this...)

def replace_post_authors_2  
  # method: destroy all linked user_posts, then create new ones
  Post.first.user_posts # display to pre-test
  Post.first.user_posts.destroy_all
  user_id_collection = [User.second.id, User.fifth.id, User.last.id]
  user_id_collection.each do |user_id|
    Post.first.user_posts.create(user_id: user_id, post_id: Post.first.id)
  end
  Post.first.user_posts # display to post-test
end

  # 16. List the posts under a given tag

def posts_of_tag
  Tag.first.posts # this works
end

  # 17. Add a new post to a given tag by only using its ID

def add_new_post_to_tag
  Tag.first.post_tags # pre-test
  Tag.first.post_tags.create(post_id: Post.first.id, tag_id: Tag.first.id)
  Tag.first.post_tags # post-test
end

  # 18. Add a new tag to a given post by only using its ID

def add_new_tag_to_post
  Post.first.post_tags # pre-test
  Post.first.post_tags.create(post_id: Post.first.id, tag_id: Tag.first.id)
  Post.first.post_tags # post-test
end

  # 19. List the tags on a given post

def tags_of_post
  Post.first.tags # this works
end

  # 20. Remove duplicate join model records

def remove_duplicate_records
  ids = PostTag.select("MIN(id) as id").group(:post_id,:tag_id).collect(&:id) # select first distinct records
  PostTag.where.not(id: ids).destroy_all

  ids = UserPost.select("MIN(id) as id").group(:post_id,:user_id).collect(&:id) # select first distinct records
  UserPost.where.not(id: ids).destroy_all  
end

  # 21. Delete a user and its user_post connections. If a post for that user has no other author, then delete the post as well. (Extra self-made question.) Note: dependencies are deleted in callback first.

def delete_user
  User.first.destroy
end

# Insert in user.rb (models) callback:
  before_destroy :delete_user_dependencies

private

def delete_user_dependencies 
  # activated before deleting user ... not tested
  # destroy associated user_posts 
  # but if a user post has no other author, destroy the post as well
  posts = User.first.posts
  posts.each do |post|
    unless post.users.count == 1 # ie, post has other authors
      User.first.user_posts.where("user_id =? and post_id = ?", User.id, post.id).destroy
    else # ie, post has only this author
      post.destroy # will destroy dependent user_post at same time
    end
  end
  
end

