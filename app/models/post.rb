class Post < ApplicationRecord
  has_many :post_authorings, class_name: "UserPost"
  has_many :authors, through: :post_authorings, source: :user
  has_many :comments
  has_many :post_taggings, class_name: "TagPost"
  has_many :tags, through: :post_taggings, source: :tag
  belongs_to :category, optional: true
end
