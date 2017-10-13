class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy

  has_many :post_authorings, dependent: :destroy
  has_many :users, through: :post_authorings

  has_many :post_taggings, dependent: :destroy
  has_many :tags, through: :post_taggings
end
