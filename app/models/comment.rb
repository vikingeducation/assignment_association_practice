class Comment < ApplicationRecord
  belongs_to :parent_post, :class_name => "Post", :foreign_key => :post_id, :inverse_of => :comments
  belongs_to :author, :class_name => "User", :foreign_key => :user_id
end
