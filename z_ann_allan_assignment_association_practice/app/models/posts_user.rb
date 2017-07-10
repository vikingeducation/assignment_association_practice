class PostsUser < ApplicationRecord
  belongs_to :posts
  belongs_to :users

end
