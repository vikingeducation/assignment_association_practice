class Post < ApplicationRecord
  has_many :comments
  belongs_to :category

  # Many to many with Tags.
  has_many :post_taggings
  has_many :tags, through: :post_taggings

  # Many to many with Posts.
  has_many :user_posts
  has_many :users, through: :user_posts
end
