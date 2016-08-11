class Post < ApplicationRecord
  has_many :comments
  belongs_to :category

  has_many :user_posts
  has_many :users, :through => :user_posts

  has_and_belongs_to_many :tags,
          :join_table => :post_tags
end
