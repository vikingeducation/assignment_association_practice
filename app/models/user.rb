class User < ActiveRecord::Base
  has_many :authored_comments, class_name: "Comment"
  has_many :post_authorings, class_name: "UserPosting"
  has_many :authored_posts, through: :user_postings, source: :post
end
