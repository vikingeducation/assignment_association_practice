class Comment < ApplicationRecord
  belongs_to :author, class_name: "User", optional: true
  belongs_to :post, :inverse_of => :comments
end
