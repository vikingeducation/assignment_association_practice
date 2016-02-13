class User < ActiveRecord::Base
  has_many :authored_comments, :dependent => :destroy, class_name: "Comment"
  has_many :authored_posts, through: :post_authorings, class_name: "Post"
  has_many :post_authorings, :dependent => :destroy, class_name: "UserPost"

  has_many :tags_on_authored_posts, through: :authored_posts, source: :tags
end
#
# User.joins("JOIN user_posts ON (user_posts.user_id = users.id) JOIN posts ON ( posts.id = user_posts.post_id) JOIN post_tags ON ( posts.id = post_tags.post_id) JOIN tags ON (tags.id = post_tags.post_id)").select("tags.id")

#---- Notes
# User has many tags thru a user_tag table --> User and Tag
#
# Post has many tags thru a post_tag table
# User has many posts thru  user_post table
