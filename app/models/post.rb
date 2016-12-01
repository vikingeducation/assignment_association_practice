class Post < ApplicationRecord
  has_many :authors, :through => :userposts, :source => :user
  has_many :userposts
  has_many :post_authorings, :through => :userposts, :source => :user
  has_many :comments, :dependent => :destroy 
  has_many :tags, :through => :posttags
  has_many :post_taggings, :through => :posttags, :source => :tag
  has_many :posttags
end
