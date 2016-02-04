class UserPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: "User", foreign_key: :author_id

  validates :post_id, uniqueness: { scope: :author_id }
end
