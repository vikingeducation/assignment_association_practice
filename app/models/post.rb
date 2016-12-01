class Post < ApplicationRecord
  has_many  :post_users
  has_many  :post_tags
  has_many  :comments
  has_many  :tags,    through: :post_tags
  has_many  :authors, through: :post_users, source: :user
  belongs_to :category
end
