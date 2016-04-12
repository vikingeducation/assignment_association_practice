class PostTag < ActiveRecord::Base
  self.table_name = "posts_tags"

  belongs_to :post
  belongs_to :tag

end
