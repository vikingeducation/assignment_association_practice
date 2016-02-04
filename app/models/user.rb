class User < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :posts, through: :user_posts
  has_many :user_posts, :dependent => :destroy
end
