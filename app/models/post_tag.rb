class PostTag < ActiveRecord::Base
  belongs_to :tagged_post, foreign_key: :post_id, class_name: "Post"
  belongs_to :tag
end
