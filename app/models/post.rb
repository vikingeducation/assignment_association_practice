class Post < ApplicationRecord
  has_many :authors, :through => :userposts, :source => :user
  has_many :userposts
  has_many :post_authorings, :through => :userposts, :source => :user
  has_many :comments
  has_many :tags, :through => :posttags
  has_many :posttags
end
