class User < ActiveRecord::Base
  has_many :posts_users
  has_many :authored_posts, through: :posts_users, class_name: "Post"
  has_many :authored_comments, class_name: "Comment"
end
