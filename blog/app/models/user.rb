class User < ApplicationRecord
  
  has_many :comments, 
           foreign_key: :author_id,
           dependent: :destroy

  has_many :user_posts,
           dependent: :destroy
  has_many :posts, through: :user_posts

end




class Author < User

end
