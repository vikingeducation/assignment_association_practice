class User < ActiveRecord::Base
  has_many :comments #authored_comments, class_name: "Comment"

  has_many :user_postings
  has_many :posts, 
            through: :user_postings,
            dependent: :destroy
end
