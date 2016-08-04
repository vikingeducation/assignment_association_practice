class User < ApplicationRecord
  has_many :authored_comments, :class_name => "Comment"
  has_many :post_authorings, class_name: "UsersPost", foreign_key: :user_id
  has_many :authored_posts, through: :post_authorings, source: :post

  has_many :tags_on_authored_posts, source: :tags, through: :authored_posts
end
