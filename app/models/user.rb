class User < ActiveRecord::Base
  has_many :authored_comments, foreign_key: :author_id, 
              class_name: "Comment"
  has_many :post_authorings, foreign_key: :author_id,
              class_name: "UserPost"

  has_many :authored_posts, through: :post_authorings,
              class_name: "UserPost",
              source: :post
end
