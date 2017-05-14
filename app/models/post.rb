class Post < ApplicationRecord
  has_many :comments
  belongs_to :category
  has_many :user_posts
  has_many :authors,
           :through => :user_posts,
           :source => :user,
           :dependent => :destroy
  has_many :post_tags
  has_many :tags,
           :through => :post_tags,
           :dependent => :destroy
end
