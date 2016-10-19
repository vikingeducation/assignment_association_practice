class Comment < ApplicationRecord
  belongs_to :author, :foreign_key => :post_id
  belongs_to :parent_post, :foreign_key => :post_id
end
