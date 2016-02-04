class Post < ActiveRecord::Base
  has_many :comments
  has_many :post_authorings,
              class_name: "UserPost"
  has_many :authors, through: :post_authorings,
              class_name: "UserPost"

  has_many :post_taggings, class_name: "PostTag"

  has_many :tags, through: :post_taggings,
              class_name: "PostTag"

  belongs_to :category
end
