class Tag < ApplicationRecord


  has_many :taggings

  # A) this works because the assoc name matches the plural of the assoc in the tagging model
  has_many :posts, through: :taggings

  # B) this works because the source matches the assoc in the tagging model
  # has_many :tagged_posts, through: :taggings, source: :post

  # A) this requires the post model to have authors, and then we match it here. weeee.
  has_many :authors, through: :posts

  # B) this source matches the assoc in the post model exactly without any pluralization
  # has_many :authors_of_tagged_posts, through: :tagged_posts, source: :authors


  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings
  has_many :tagged_posts, through: :taggings, source: :post
  has_many :post_taggings, class_name: 'Tagging', dependent: :destroy

  has_many :user_postings, :through => :tagged_posts, :source => :post_authorings
  has_many :authors_of_tagged_posts, :through => :user_postings, :class_name => 'User', :source => :user

end
