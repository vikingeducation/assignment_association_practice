class Tag < ApplicationRecord
  # Many to many with Posts.
  has_many :post_taggings, dependent: :destroy

  has_many :tagged_posts, through: :post_taggings,
                                   :source => :post


  has_many :authors_of_tagged_posts, :through =>  :tagged_posts,
                                     :source  => :users
end