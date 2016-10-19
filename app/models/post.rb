class Post < ApplicationRecord
  has_many :comments, :inverse_of => :parent_post, :dependent => :destroy
  has_many :post_authorings, :foreign_key => :post_id, :dependent => :destroy
  has_many :post_taggings, :foreign_key => :post_id, :dependent => :destroy
  has_many :tags, :through => :post_taggings
  belongs_to :category
end
