class Tag < ApplicationRecord
  has_and_belongs_to_many :tagged_posts, :class_name => "Post"
end
