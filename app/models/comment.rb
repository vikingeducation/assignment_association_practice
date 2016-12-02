class Comment < ApplicationRecord
  belongs_to :user, :foreign_key => :author_id
  belongs_to :author, :class_name => "User"
  belongs_to :post
  belongs_to :parent_post, :class_name => "Post"
end
