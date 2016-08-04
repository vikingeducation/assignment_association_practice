class Post < ApplicationRecord
  has_many :comments

  has_many :users_posts
  has_many :users, through: :users_posts

  has_many :taggings
  has_many :tags, through: :taggings
end
