class PostTag < ApplicationRecord
  belongs_to :tag, optional: true
  belongs_to :post, optional: true
end
