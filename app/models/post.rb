class Post < ApplicationRecord
  has_many :post_authorings, class_name: "UserPost"
  has_many :authors, through: :post_authorings, source: :user
  has_many :comments
  has_many :tag_posts
  has_many :tags, through: :tag_posts
  belongs_to :category
end
