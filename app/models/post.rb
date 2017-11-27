class Post < ApplicationRecord
  belongs_to :category
  has_many :post_authorings, class_name: 'UserPost'
  has_many :authors, through: :post_authorings, source: :user
  has_many :comments

  has_many :post_taggings
  has_many :tags, through: :post_taggings
end
