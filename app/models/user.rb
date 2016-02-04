class User < ActiveRecord::Base
  has_many :authored_comments, foreign_key: :user_id, class_name: "Comment"

  has_many :user_posts
  has_many :authored_posts, :through => :user_posts, foreign_key: :user_id, source: :post
end
