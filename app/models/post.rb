class Post < ApplicationRecord
  has_many :comments
  belongs_to :category
  has_many :user_posts
  has_many :authors,
           :through => :user_posts,
           :source => :user,
           :dependent => :destroy
  has_many :post_authorings,
           :class_name => "UserPost"
  has_many :post_taggings,
           :class_name => "PostTag"
  has_many :tags,
           :through => :post_taggings,
           :dependent => :destroy
end
