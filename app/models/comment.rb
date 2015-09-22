class Comment < ActiveRecord::Base

  belongs_to :author,
  :class_name =>"User",
  :foreign_key => "user_id"

  belongs_to :parent_post,
  :foreign_key => "post_id",
  :class_name => "Post"

end
