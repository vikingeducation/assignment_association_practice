class Post < ApplicationRecord
  has_many :comments , :dependent => :destroy
  belongs_to :category, :foreign_key => :category_id
  
  has_many :post_taggings
  has_many :tags, :through => :post_taggings

  has_many :user_posts
  has_many :authors, :through => :user_posts,
                     :source => :user
end
