class User < ApplicationRecord
  # create .post_authorings
  # no need to traverse THROUGH a join table, since the next step is a join table
  # foreign keys are located on the join table
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
  has_many :authored_posts, through: :post_authorings, source: :post

  # user to post_user to post to post_tag to tag
  has_many :tags_on_authored_posts, through: :authored_posts, source: :tags
end
