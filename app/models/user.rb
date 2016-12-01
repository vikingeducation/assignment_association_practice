class User < ApplicationRecord
  has_many :post_users, dependent: :destroy

  # create a method .authored_comments for User
  # there is no join table, so simply specify a class_name
  # foreign key exists on Comment, no foreign_key assignment needed
  has_many :authored_comments, class_name: 'Comment',
                               dependent: :destroy

  # create a method .authored_posts
  # associations are traversed through a join table
  # the other side of the join table is Post
  has_many :authored_posts, through: :post_users, source: :post
end
