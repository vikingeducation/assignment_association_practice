class UserPosting < ActiveRecord::Base
  belongs_to :user
  belongs_to :post #authored_post, class_name: "Post", foreign_key: :post_id
end
