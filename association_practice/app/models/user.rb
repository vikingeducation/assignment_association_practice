class User < ApplicationRecord
  has_many :authored_comments, :class_name => "Comment"
  has_many :users_posts
  has_many :posts, through: :users_posts
end
