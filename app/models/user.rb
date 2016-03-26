class User < ActiveRecord::Base
  has_many :comments
  has_many :post_users
  has_many :posts, through: :post_users

end
