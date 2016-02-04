class User < ActiveRecord::Base
  has_many :authored_comments, :dependent => :destroy, class_name: "Comment"
  has_many :authored_posts, through: :user_posts, class_name: "Post"
  has_many :post_authorings, :dependent => :destroy, class_name: "UserPost" 

  #has_many :tags_on_authored_posts, through: :user_tags, class_name: "Tags"
  has_and_belongs_to_many :tags_on_authored_posts, class_name: "Tag"
end



#---- Notes
# User has many tags thru a user_tag table --> User and Tag
#
# Post has many tags thru a post_tag table
# User has many posts thru  user_post table
