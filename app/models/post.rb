class Post < ApplicationRecord
  has_many   :post_users, dependent: :destroy 
  has_many   :post_tags,  dependent: :destroy 
  has_many   :comments,   dependent: :destroy 
  has_many   :tags,    through: :post_tags
  has_many   :authors, through: :post_users, source: :user
  belongs_to :category
end
