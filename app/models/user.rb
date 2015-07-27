class User < ActiveRecord::Base
  has_many :authored_comments, :class_name => "Comment"
  has_many :user_postings
  has_many :posts, through: :user_postings

end
