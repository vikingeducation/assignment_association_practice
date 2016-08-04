class Post < ActiveRecord::Base
  has_many :post_authorings, class_name: "UserPost", dependent: :destroy
  has_many :authors, source: :user, through: :post_authorings
  has_many :post_taggings, class_name: "PostTag", dependent: :destroy
  has_many :tags, through: :post_taggings
  has_many :comments, dependent: :destroy
  belongs_to :category
end
