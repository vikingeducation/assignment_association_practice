class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :posts_users
  has_many :users, through: :posts_users
  has_many :taggings
  has_many :tags, through: :taggings
end
