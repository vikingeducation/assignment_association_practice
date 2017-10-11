class Comment < ApplicationRecord
  belongs_to :author, :class_name => "User", :foreign_key => :author_id
  belongs_to :post, inverse_of: :comments


  # belongs_to :parent_post, :class_name => "Post", foreign_key: :post_id

  def parent_post
    post
  end
end
