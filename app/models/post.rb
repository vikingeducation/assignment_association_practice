class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :category

  has_many :post_authorings, class_name: 'user_post'

  has_many :authors, :through => :user_posts, source: :user 

  has_many :post_tags
  has_many :tags, :through => :post_tags 
end
