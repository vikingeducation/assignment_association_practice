class User < ApplicationRecord
  has_many :authored_comments,
           :foreign_key => :user_id,
           :class_name => "Comment"
  has_many :post_authorings,
           :class_name => "UserPost"
  has_many :authored_posts,
           :through => :post_authorings,
           :source => :post,
           :dependent => :destroy
  has_many :tags_on_authored_posts,
           :through => :authored_posts,
           :source => :post_taggings
end
