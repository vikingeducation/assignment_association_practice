class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :tags, through: :post_tags
  has_many :users, through: :user_posts
  has_many :user_posts, :dependent => :destroy
  has_many :post_tags, :dependent => :destroy
  belongs_to :category
end
