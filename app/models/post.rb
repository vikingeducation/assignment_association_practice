class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :post_users
  has_many :users, through: :post_users

end
