class Post < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :users, :through => :user_posts
  has_many :tags, :through => :post_tags
end
