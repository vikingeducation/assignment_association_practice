class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy
  belongs_to :category

  has_many :post_tags, :dependent => :destroy
  has_many :tags, :through => :post_tags, :dependent => :destroy

  has_many :user_posts
  has_many :users, :through => :user_posts

end
