class UserPost < ActiveRecord::Base
  belongs_to :post
  
  belongs_to :user,
              foreign_key: :author_id

  validates :post_id, 
              uniqueness: { scope: :author_id }
end
