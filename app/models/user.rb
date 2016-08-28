class User < ApplicationRecord
  has_many :authored_comments,
           :foreign_key => :user_id,
           class_name: "Comment",
           :dependent => :destroy

  has_many :tags_on_authored_posts,
           :through => :authored_posts,
           :source => :tags

  has_many :post_authorings,
           :foreign_key => :user_id,
           class_name: "UserPost",
           :dependent => :destroy
  has_many :authored_posts, :through => :post_authorings, :source => :post
end
