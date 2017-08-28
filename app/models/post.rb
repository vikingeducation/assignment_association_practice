class Post < ApplicationRecord
  belongs_to :category

  has_many :comments

  has_many :user_postings
  has_many :users, through: :user_postings

  has_many :post_taggings
  has_many :tags, through: :post_taggings
end
