class PostTagging < ApplicationRecord
  belongs_to :post, foreign_key: 'post_id'
  belongs_to :tag, optional: true
end
