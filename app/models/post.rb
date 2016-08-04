class Post < ApplicationRecord
  has_many :user_posts
  has_many :users, through: :user_posts
  has_many :comments
  has_many :tag_posts
  has_many :tags, through: :tag_posts
  belongs_to :category
end
