class User < ActiveRecord::Base
  has_many :posts_users
  has_many :posts, through: :posts_users
end
