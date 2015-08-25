class Tag < ActiveRecord::Base
  has_many :post_taggings, dependent: :destroy
  has_many :tagged_posts, through: :post_taggings, source: :post

  has_many :post_authorings, through: :tagged_posts
  has_many :authors_of_tagged_posts, 
            through: :post_authorings, 
            source: :user
end
