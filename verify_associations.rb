class Verification

  def self.user_with_posts
    Post.all.shuffle.first.users.first
  end

  def self.all_users
    User.all
  end

  def self.all_comments
    Comment.all
  end

  def self.all_posts
    Post.all
  end

  def self.all_categories
    Category.all
  end

  def self.all_tags
    Tag.all
  end

  def self.list_user_comments
    user = Comment.first.user.comments
  end

  def self.set_comment_new_user
    Comment.first.user = User.first
  end

  def self.set_post_dif_cat
    Post.all.shuffle.first.category = Category.first
  end

  def self.set_new_users_comments
    User.first.comments = [Comment.first, Comment.second]
  end

  def self.return_comment_author
    Comment.first.user
  end

  def self.list_posts_comments
    Comment.all.shuffle.first.post.comments
  end

  def self.comments_parent_post
    Comment.all.shuffle.first.post
  end

  def self.remove_post_from_category
    cat = Category.all.shuffle.first
    posts = cat.posts
    cat.posts.delete(posts.first)
  end

  def self.list_users_posts
    user_with_posts.posts
  end

  def self.list_users_posts_ids
    user_with_posts.post_ids
  end

  def self.replace_users_posts
    User.first.posts = [Post.first, Post.second]
  end

  def self.posts_authors
    Post.first.users
  end

  def self.set_posts_authors
    Post.first.users = [User.first, User.second]
  end

  def

end
