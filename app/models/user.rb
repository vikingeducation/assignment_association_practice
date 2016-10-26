  class User < ActiveRecord::Base
  has_many :authored_comments, foreign_key: "user_id", class_name: "Comment",
            dependent: :destroy

  has_many :user_posts
  has_many :authored_posts, through: :user_posts,
            source: :post
  has_many :post_authorings, through: :user_posts,
            source: :post
end
