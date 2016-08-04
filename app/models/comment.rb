class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  belongs_to :parent_post, :class_name => "Post"
end
