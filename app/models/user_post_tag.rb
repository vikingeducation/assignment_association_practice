class UserPostTag < ActiveRecord::Base
  belongs_to :user_post
  belongs_to :post_tag
end
