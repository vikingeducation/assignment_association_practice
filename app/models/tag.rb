class Tag < ActiveRecord::Base
  has_many :post_taggings, class_name: "Tagging"
  has_many :tagged_posts, through: :post_taggings
  has_many :authors_of_tagged_posts, through: :tagged_posts, source: :authors
end
