class Comment < ApplicationRecord

  belongs_to :post, inverse_of: :comments,
             optional: true

  belongs_to :author, 
             foreign_key: :author_id,
             class_name: "User"

end

