class Post < ApplicationRecord
  belongs_to :category
  has_many :post_users
  has_many :authors, through: :post_users, source: :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :comments

end
