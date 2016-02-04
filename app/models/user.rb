class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :user_posts
  has_many :user_posts
end
