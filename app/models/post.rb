class Post < ApplicationRecord
  has_many :users
  has_many :comments
  has_many :tag_posts
  has_many :tags, through: :tag_posts
  belongs_to :category
end
