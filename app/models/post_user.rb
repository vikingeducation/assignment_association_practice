class PostUser < ApplicationRecord
  self.table_name = "post_users"

  belongs_to :post
  belongs_to :user
end
