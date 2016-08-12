class User < ApplicationRecord
  has_many :authored_comments, :class_name => "Comment"

  has_many :tags_on_authored_posts, :through => :authored_posts, :source => :tags


  has_and_belongs_to_many :authored_posts, :class_name => "Post",
    # :foreign_key => :post_id,
      :join_table => :user_posts



end
