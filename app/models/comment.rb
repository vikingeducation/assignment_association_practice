class Comment < ApplicationRecord
  belongs_to :author, :class_name => "User", :foreign_key => :user_id
  belongs_to :parent_post, :class_name => "Post", :foreign_key => :post_id
end
