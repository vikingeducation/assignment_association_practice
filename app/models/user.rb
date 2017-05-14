class User < ApplicationRecord
  has_many :authored_comments,
           :foreign_key => :user_id,
           :class_name => "Comment"
  has_many :post_authorings,
           :class_name => "UserPost"
  has_many :authored_posts,
           :through => :user_posts,
           :source => :post,
           :dependent => :destroy
end
