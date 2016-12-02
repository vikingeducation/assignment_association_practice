class User < ApplicationRecord
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :post_users, foreign_key: :author_id, dependent: :destroy
  has_many :posts, through: :post_users, dependent: :destroy
end
