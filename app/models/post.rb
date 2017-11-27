class Post < ApplicationRecord
  belongs_to :category

  has_many :user_posts
  has_many :users, through: :user_posts

  has_many :comments
end
