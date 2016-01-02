class User < ActiveRecord::Base
  # Many-to-Many regular and renamed
  has_many :post_authors, foreign_key: :author_id
  has_many :authored_posts, through: :post_authors, foreign_key: :author_id, source: :post

  # One-to-Many with renamed foreign key and renamed again
  has_many :comments, foreign_key: :author_id
  has_many :authored_comments, foreign_key: :author_id, class_name: 'Comment'

  has_many :tags_on_authored_posts, through: :authored_posts, source: :tags
end
