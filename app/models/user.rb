class User < ApplicationRecord
  #has_many :comments
  has_many :authored_comments,
           :foreign_key => :user_id,
           :class_name => "Comment"
  has_many :user_posts
  has_many :posts,
           :through => :user_posts,
           :dependent => :destroy
end
