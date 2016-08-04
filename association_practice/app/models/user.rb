class User < ApplicationRecord
  has_many :comments
  has_many :users_posts
  has_many :posts, through: :users_posts
end
