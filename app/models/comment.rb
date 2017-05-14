class Comment < ApplicationRecord
  belongs_to :author,
             :foreign_key => :user_id,
             :class_name => "User"
  belongs_to :post
end
