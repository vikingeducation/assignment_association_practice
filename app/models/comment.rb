class Comment < ActiveRecord::Base
  belongs_to :user #author, class_name: "User", foreign_key: :user_id
  belongs_to :post
end
