class Comment < ApplicationRecord
  belongs_to :author, class_name: "User", optional: true, dependent: :destroy
  belongs_to :post, class_name: "Post"
end
