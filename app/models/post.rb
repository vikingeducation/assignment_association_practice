class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :post_authorings, class_name: 'UserPosting'
  has_many :authors, :through => :post_authorings, source: :user
  has_many :tags, :through => :post_taggings
  has_many :post_taggings
  belongs_to :category

end
