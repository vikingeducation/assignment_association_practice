class User < ApplicationRecord
  has_many :authored_comments, :class_name => "Comment", :dependent => :destroy

  has_many :user_posts, :dependent => :delete_all
  has_many :authored_posts, :through => :user_posts, :source => :post

  has_many :tags_on_authored_posts, :through => :authored_posts, :source => :tags
end
