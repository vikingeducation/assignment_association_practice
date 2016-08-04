class User < ApplicationRecord
  has_many :authored_comments, class_name: 'Comment'

  # Many to many with Posts.
  has_many :post_authorings, class_name: 'UserPost'
  has_many :authored_posts, through: :user_posts,
                            source: :post,
                            dependent: :destroy
end
