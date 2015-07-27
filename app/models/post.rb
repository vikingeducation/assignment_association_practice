class Post < ActiveRecord::Base
  has_many :comments
  has_many :users through :user_posting
  has_many :tags through :post_taggings
end
