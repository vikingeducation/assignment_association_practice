class User < ApplicationRecord
  has_many :authored_comments, class_name: 'Comment', dependent: :destroy

  has_many :post_authorings, class_name: 'UserPost', dependent: :destroy
  has_many :authored_posts, through: :post_authorings, source: :post

  has_many :post_taggings, through: :authored_posts, source: :post_taggings
  has_many :tags_on_authored_posts, through: :post_taggings, source: :tag
end
