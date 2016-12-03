class Comment < ApplicationRecord
  belongs_to :user, :foreign_key => :author_id, optional: true
  belongs_to :post, inverse_of: :comments
end
