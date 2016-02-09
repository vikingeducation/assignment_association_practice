class UserPost < ActiveRecord::Base
  belongs_to :authored_post, class_name: "Post", foreign_key: :post_id
  belongs_to :author, class_name: "User", foreign_key: :user_id

  validates :user_id, :uniqueness => { :scope => :post_id }
end
