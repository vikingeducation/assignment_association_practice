class User < ApplicationRecord
  has_many :post_users
  has_many :comments
  has_many :posts, through: :post_users
end
