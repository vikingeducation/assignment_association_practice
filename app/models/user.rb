class User < ActiveRecord::Base
  has_many :post_authorings, :class_name => 'UserPosting'
  has_many :authored_posts, :through => :post_authorings, :class_name => 'Post', :source => :post
  has_many :authored_comments, :class_name => 'Comment'

  has_many :post_taggings, :through => :authored_posts
  has_many :tags_on_authored_posts, :through => :post_taggings, :class_name => 'Tag', :source => :tag
end
