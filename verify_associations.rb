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
    user = Comment.first.author.authored_comments
  end

  def self.set_comment_new_user
    Comment.first.author = User.first
  end

  def self.set_post_dif_cat
    Post.all.shuffle.first.category = Category.first
  end

  def self.set_new_users_comments
    User.first.authored_comments = [Comment.first, Comment.second]
  end

  def self.return_comment_author
    Comment.first.author
  end

  def self.list_posts_comments
    Comment.all.shuffle.first.parent_post.comments
  end

  def self.comments_parent_post
    Comment.all.shuffle.first.parent_post
  end

  def self.remove_post_from_category
    cat = Category.all.shuffle.first
    posts = cat.posts
    cat.posts.delete(posts.first)
  end

  def self.list_users_posts
    Post.all.first.authors.last.authored_posts
  end

  def self.list_users_posts_ids
    Post.first.authors.last.authored_post_ids
  end

  def self.replace_users_posts
    User.first.authored_posts = [Post.first, Post.second]
  end

  def self.posts_authors
    Post.first.authors
  end

  def self.set_posts_authors
    Post.first.authors = [User.first, User.second]
  end

  def self.set_posts_authors_ids
    Post.first.author_ids = [User.pluck(:id).sample,User.pluck(:id).sample ]
  end

  def self.tag_posts
    Tag.first.tagged_posts
  end

  def self.add_post_to_tag_id
    Tag.first.tagged_post_ids << Post.pluck(:id).sample
  end

  def self.add_tag_to_post_id
    Post.first.tag_ids << Tag.ids.sample
  end

  def self.tags_on_post
    Post.first.tags
  end

end


%w(all_users all_comments all_posts all_categories all_tags list_user_comments set_comment_new_user set_post_dif_cat set_new_users_comments return_comment_author list_posts_comments comments_parent_post remove_post_from_category list_users_posts list_users_posts_ids replace_users_posts posts_authors set_posts_authors set_posts_authors_ids tag_posts add_post_to_tag_id add_tag_to_post_id tags_on_post).each do |method|

  puts Verification.send(method.to_sym)
end
