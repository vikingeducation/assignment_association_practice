class Post < ApplicationRecord
  has_many :comments
  has_and_belongs_to_many :users, :join_table => :user_postings
  has_and_belongs_to_many :tags, :join_table => :post_taggings
  belongs_to :category

end
