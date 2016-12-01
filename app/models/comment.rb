class Comment < ApplicationRecord
  belongs_to :user, :class_name =>  "author"
  belongs_to :post
end
