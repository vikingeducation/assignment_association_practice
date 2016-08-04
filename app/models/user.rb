class User < ApplicationRecord
  has_many :authored_comments, :class_name => "Comment", foreign_key: :author_id
  has_many :post_authorings
  has_many :authored_posts, through: :post_authorings, source: :post
end

