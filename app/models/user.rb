class User < ApplicationRecord
  has_many :authored_comments, :class_name => "Comment", :foreign_key => :author_id, :dependent => :destroy

  has_many :user_posts
  has_many :authored_posts, :through => :user_posts,
                            :source => :post,
                            :dependent => :nullify

  has_many :post_authorings, :class_name => "UserPost"
  # allows you to do this User.first.post_authorings - renaming the join table through an association

# First, for a given user, return the collection of
#   tags on every post that user has authored
# User.first.tags_on_authored_posts
  has_many :tags_on_authored_posts, :through => :authored_posts,
                                    :source => :post_taggings
                                  
end
