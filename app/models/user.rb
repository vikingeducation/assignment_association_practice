class User < ApplicationRecord
  has_many :post_authorings, class_name: "UserPost"
  has_many :authored_posts, through: :post_authorings, source: :post
  has_many :authored_comments, class_name: "Comment"
  has_many :tags_on_authored_posts, through: :authored_posts, source: :tag
end
