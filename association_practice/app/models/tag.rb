class Tag < ApplicationRecord
  has_many :post_taggings, class_name: "Tagging", foreign_key: :tag_id, :dependent => :destroy
  has_many :tagged_posts, through: :post_taggings, source: :post
  has_many :authors_of_tagged_posts, through: :tagged_posts, source: :authors
end
