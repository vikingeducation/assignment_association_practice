class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :tagged_post, foreign_key: :post_id, class_name: "Post"
end
