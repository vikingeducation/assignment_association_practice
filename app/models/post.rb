class Post < ActiveRecord::Base
  has_many :comments
  has_many :tags, through: :post_tags
  has_many :users, through: :user_posts
  belongs_to :category
end
