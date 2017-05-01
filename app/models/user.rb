class User < ApplicationRecord

  has_and_belongs_to_many :authored_posts, :class_name => "Post"
  has_many :authored_comments, :class_name => "Comment"

end
