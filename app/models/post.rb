class Post < ApplicationRecord

  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :user_posts
  has_many :authors, :through => :user_posts, :source => :user
  has_many :post_tags
  has_many :tags, :through => :post_tags

end
