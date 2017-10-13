class Post < ApplicationRecord
  belongs_to :category
  has_many :comments

  has_many :post_authorings
  has_many :users, through: :post_authorings

  has_many :post_taggings
  has_many :tags, through: :post_taggings
end
