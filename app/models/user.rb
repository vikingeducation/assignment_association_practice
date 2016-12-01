class User < ApplicationRecord
  has_many :post_users, dependent: :destroy 
  has_many :authored_comments, class_name: 'Comment', 
                               dependent: :destroy 
  has_many :posts, through: :post_users
end
