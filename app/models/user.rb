class User < ApplicationRecord
  has_many :post_authorings, class_name: 'PostUser',
                             dependent: :destroy

  # create a method .authored_comments for User
  # there is no join table, so simply specify a class_name
  # foreign key exists on Comment, no foreign_key assignment needed
  has_many :authored_comments, class_name: 'Comment',
                               dependent: :destroy

  # create a method .authored_posts
  # associations are traversed through a join table
  # the other side of the join table is Post
  has_many :authored_posts, through: :post_users, source: :post
  has_many :post_tags, 
  has_many :tags_on_authored_posts, through: :post_tags, source: :tags
end

# user to post_user to post to post_tag to tag