class Comment < ApplicationRecord
  belongs_to :author, source: :user
  belongs_to :post
end
