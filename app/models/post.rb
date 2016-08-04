class Post < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :post_authorings, :class_name => "UserPost"
  has_many :post_tags
  has_many :authors, :through => :post_authorings
  has_many :tags, :through => :post_tags
end
