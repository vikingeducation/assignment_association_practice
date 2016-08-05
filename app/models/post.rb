class Post < ApplicationRecord
  has_many :comments, foreign_key: :parent_post
  accepts_nested_attributes_for :comments 
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
  has_many :post_taggings
   has_many :tags, through: :post_taggings

  has_many :post_authorings
  has_many :authors, through: :post_authorings, :source => :user

  belongs_to :category, optional: true

end
