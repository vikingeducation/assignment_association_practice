class User < ApplicationRecord
  has_many :comments
  has_many :post_users, foreign_key: :author_id
  has_many :posts, through: :post_users
end
