class User < ActiveRecord::Base
  has_many :authored_comments, class_name: "Comment"

  has_many :user_posting
  has_many :authored_posts, through: :user_posting,
            dependent: :destroy
end
