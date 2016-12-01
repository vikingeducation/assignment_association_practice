class User < ApplicationRecord
  has_many :authored_comments,
           :class_name => "Comment", :foreign_key => :user_id

  has_many :post_authorings,
           :class_name => "PostUser",
           :foreign_key => :user_id
  
  has_many :authored_posts,
           :through => :post_authorings,
           :foreign_key => :user_id,
           :source => :post
end
