class Post < ActiveRecord::Base
  has_many :comments

  has_many :user_posting
  has_many :users, through: :user_posting

  has_many :post_tagging
  has_many :tags, through: :post_tagging
end
