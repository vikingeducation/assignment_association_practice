class PostUser < ActiveRecord::Base
  self.table_name = "posts_users"

  belongs_to :post
  belongs_to :user
end
