class User < ApplicationRecord
  has_many :authored_comments, class_name: 'Comment'

  has_many :post_authorings
  has_many :authored_posts, through: :post_authorings, source: :post

  has_many :post_taggings, through: :authored_posts
  has_many :tags_on_authored_posts, through: :post_taggings, source: :tag
end
