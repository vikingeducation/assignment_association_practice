class PostUser < ActiveRecord::Base
  self.table_name = "posts_users"

  belongs_to :user
end
