class Comment < ApplicationRecord
  # :author creates the .author method on Comment
  # we don't have a join table for User : Comment, so we define .author method (via setting a class_name and foreign_key)
  belongs_to :author,      class_name: 'User', foreign_key: 'user_id', optional: true
  belongs_to :parent_post, class_name: 'Post', foreign_key: 'post_id', inverse_of: :comments
end
