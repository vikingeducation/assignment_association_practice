class Post < ApplicationRecord
  has_many :comments
  belongs_to :category
  has_many :users,
           :through => :user_posts,
           :dependent => :destroy
  has_many :tags,
           :through => :post_tags,
           :dependent => :destroy
end
