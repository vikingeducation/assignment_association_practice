class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :user_postings
  has_many :authors, :through => :user_postings, :class_name => 'User', :source => :user
  has_many :post_taggings
  has_many :tags, :through => :post_taggings
end
