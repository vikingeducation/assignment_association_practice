class Post < ActiveRecord::Base
  has_many :post_authorings, class_name: "Authoring"
  has_many :authors, through: :post_authorings, source: :user

  has_many :post_taggings, class_name: "Tagging"
  has_many :tags, through: :post_taggings

  has_many :comments
end
