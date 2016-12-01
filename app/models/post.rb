class Post < ApplicationRecord
  has_many  :posts_users
  has_many  :posts_tags
  has_many  :tags,    through: :posts_tags
  has_many  :authors, through: :posts_users, source: :user
  belong_to :category
end
