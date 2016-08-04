class Comment < ApplicationRecord
  belongs_to :author, foreign_key: :user_id, class_name: "User"
  belongs_to :parent_post, class_name: "Post", foreign_key: :post_id
end
