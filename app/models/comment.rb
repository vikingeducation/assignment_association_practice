class Comment < ActiveRecord::Base

  belongs_to :post, foreign_key: :post_id, class_name: "Post"
  belongs_to :author, foreign_key: :user_id, class_name: "User"

end
