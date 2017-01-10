class User < ApplicationRecord
  has_many :authored_comments, 
           foreign_key: :user_id, 
           class_name: "Comment"

  has_many :post_authorings,
           :foreign_key => :user_id,
           class_name: "UserPost"

  has_many :authored_posts,
           :through => :post_authorings,
           :source => :post

  has_many :tags_on_authored_posts,
           :through => :authored_posts,
           :source => :tags

end
