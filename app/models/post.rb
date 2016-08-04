class Post < ActiveRecord::Base
  has_many :post_authorings, class_name: "UserPost"
  has_many :authors, source: :user, through: :post_authorings
  has_many :post_taggings, class_name: "PostTag"
  has_many :tags, through: :post_taggings
  has_many :comments
  belongs_to :category
end
