class Tag < ApplicationRecord

  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings
  has_many :tagged_posts, through: :taggings, source: :post
  has_many :post_taggings, class_name: 'Tagging', dependent: :destroy

  has_many :user_postings, :through => :tagged_posts, :source => :post_authorings
  has_many :authors_of_tagged_posts, :through => :user_postings, :class_name => 'User', :source => :user

end
