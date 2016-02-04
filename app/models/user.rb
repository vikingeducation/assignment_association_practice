class User < ActiveRecord::Base
  has_many :authored_comments, :dependent => :destroy, class_name: "Comment"
  has_many :authored_posts, through: :user_posts, class_name: "Post"
  has_many :user_posts, :dependent => :destroy
end
