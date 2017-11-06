class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :parent_post, foreign_key: :post_id, class_name: 'Post', inverse_of: :comments
end
