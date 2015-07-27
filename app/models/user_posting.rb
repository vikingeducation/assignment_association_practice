class UserPosting < ActiveRecord::Base
  belongs_to :user
  belongs_to :authored_post, class_name: "Post", foreign_key: :post_id
end
