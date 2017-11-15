class Post < ApplicationRecord

  belongs_to :category
  has_many :comments
  has_many :users_posts
  has_many :users, :through => :users_posts
  has_many :posts_tags
  has_many :tags, :through => :posts_tags

end
