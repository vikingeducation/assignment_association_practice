class User < ActiveRecord::Base
  has_many :comments

  has_many :user_posting
  has_many :posts, through: :user_posting
end
