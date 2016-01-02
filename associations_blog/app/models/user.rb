class User < ActiveRecord::Base
  has_many :post_authors, foreign_key: :author_id
  has_many :authored_posts, through: :post_authors, foreign_key: :author_id, source: :post
  has_many :comments, foreign_key: :author_id

  # TODO: why doesn't this work?
  has_many :authored_comments, foreign_key: :author_id, source: :comment
end
