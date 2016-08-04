class Post < ApplicationRecord
  has_many :comments

  has_many :post_tags
   has_many :tags, through: :post_tags

  has_many :user_posts
  has_many :users, through: :user_posts

  belongs_to :category, optional: true
end
