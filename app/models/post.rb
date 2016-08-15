class Post < ActiveRecord::Base
  has_many :comments
  has_many :tags, through: :taggings
  has_many :users, through: :user_posts
  has_many :user_posts
  has_many :taggings
end
