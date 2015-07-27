class Tag < ActiveRecord::Base
  has_many :tagged_posts, through: :taggings, source: :post
  has_many :post_taggings, :class_name => "Tagging"
end
