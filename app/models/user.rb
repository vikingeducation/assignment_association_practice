class User < ActiveRecord::Base
  has_many :comments, foreign_key: :author_id
  has_many :user_posts
  has_many :posts, through: :user_posts 
end
