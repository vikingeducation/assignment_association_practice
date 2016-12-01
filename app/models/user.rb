class User < ApplicationRecord
  has_many :authored_posts, :through => :userposts, :source => :post
  has_many :userposts
  has_many :post_authorings, :through => :userposts, :source => :post
  has_many :authored_comments, :class_name => "Comment", :foreign_key => :author_id
end
