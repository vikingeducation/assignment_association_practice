class Tag < ActiveRecord::Base
  
  has_many :tagged_posts, through: :taggings, source: :post
  has_many :post_taggings, :class_name => "Tagging", dependent: :delete_all
  
  has_many :authors_of_tagged_posts, through: :tagged_posts, source: :authors
end
