class User < ApplicationRecord
  has_many :authored_comments, :class_name => "Comment", :dependent => :destroy
  has_and_belongs_to_many :authored_posts, :class_name => "Post"
end
