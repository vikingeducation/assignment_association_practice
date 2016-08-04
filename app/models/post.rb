class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_and_belongs_to_many :users, :join_table => :user_postings
  has_and_belongs_to_many :tags, :join_table => :post_taggings
end
