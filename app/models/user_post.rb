class UserPost < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post_id, :uniqueness => { :scope => :tag_id }
  
end
