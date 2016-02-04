class UserPost < ActiveRecord::Base
  has_many :posts
  has_many :users

  validates :user_id, :uniqueness => { :scope => :post_id }
end
