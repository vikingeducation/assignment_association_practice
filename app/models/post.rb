class Post < ActiveRecord::Base
  has_many :comments
  has_many :user_postings
  has_many :authors, :source => :user, through: :user_postings
  has_many :post_taggings
  has_many :tags, through: :post_taggings
end
