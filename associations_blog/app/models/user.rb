class User < ActiveRecord::Base
  has_many :post_authors, foreign_key: :author_id
  has_many :authored_posts, through: :post_authors, foreign_key: :author_id, source: :post
end
