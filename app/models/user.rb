class User < ApplicationRecord

  has_many :posts_users, :dependent => :destroy
  has_many :post_authorings, :through => :posts_users, :source => :post

  has_and_belongs_to_many :posts
  has_many :comments, :dependent => :destroy
  has_many :authored_comments, :class_name => "Comment"
  has_and_belongs_to_many :authored_posts, :class_name => "Post"

  has_many :tags_on_authored_posts, 
            :through => :post_authorings,
            :source => :tags

end