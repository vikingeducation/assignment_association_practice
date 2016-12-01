class Tag < ApplicationRecord
  has_many :post_taggings, class_name: 'PostTag', dependent: :destroy
  has_many :tagged_posts, through: :post_tags, source: :post
  
  validates :name, uniqueness: true
end
