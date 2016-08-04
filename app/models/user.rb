class User < ApplicationRecord
  has_many :comments

  # Many to many with Posts.
  has_many :user_posts
  has_many :posts, through: :user_posts
end
