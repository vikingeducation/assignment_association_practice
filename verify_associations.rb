class Verification
  def self.all_users
    User.all
  end

  def self.all_comments
    Comment.all
  end

  def self.all_posts
    Post.all
  end


end