class User < ApplicationRecord

  has_many :user_posts, dependent: :destroy
  has_many :authored_posts, through: :user_posts, source: :post

  has_many :comments, dependent: :destroy
  has_many :authored_comments, class_name: 'Comment', dependent: :destroy


end
