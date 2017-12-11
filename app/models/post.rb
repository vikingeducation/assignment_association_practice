class Post < ApplicationRecord

  belongs_to :category

  has_many :user_posts, dependent: :destroy
  has_many :users, through: :user_posts
  has_many :authors, :through => :user_posts, :source => :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :comments, dependent: :destroy

end
