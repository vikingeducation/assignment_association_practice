class Post < ApplicationRecord
  has_many :comments
  accepts_nested_attributes_for :comments 

  has_many :post_taggings
   has_many :tags, through: :post_taggings

  has_many :post_authorings
  has_many :authors, through: :post_authorings, :source => :user

  belongs_to :category, optional: true

end
