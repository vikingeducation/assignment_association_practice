class Post < ApplicationRecord

  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :post_authorings, :class_name => "UserPost", dependent: :destroy 
  has_many :authors, :through => :post_authorings, :source => :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, :through => :post_tags

end
