class PostsUser < ActiveRecord::Base
  belongs_to :author, foreign_key: :user_id, class_name: "User"
  belongs_to :authored_post, foreign_key: :post_id, class_name: "Post"
end
