class User < ApplicationRecord
  has_many :authored_comments, class_name: 'Comment'

  # Many to many with Posts.
  has_many :post_authorings, class_name: 'UserPost'

  has_many :authored_posts, through: :post_authorings,
                            source: :post,
                            dependent: :destroy

  has_many :tags_on_authored_posts, :through => :authored_posts,
                            :source =>  :tags
end
