class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :post_authorings, class_name: "PostsUser"
  has_many :authors, through: :post_authorings

  has_many :post_taggings, class_name: "Tagging"
  has_many :tags, through: :post_taggings
end
