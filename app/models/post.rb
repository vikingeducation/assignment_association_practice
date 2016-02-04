class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :posts_users
  has_many :authors, through: :posts_users, class_name: "User"
  has_many :taggings
  has_many :tags, through: :taggings
end
