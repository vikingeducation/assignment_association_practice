class User < ApplicationRecord

  has_many :post_authorings, dependent: :destroy
  has_many :authored_posts, through: :post_authorings, source: :post

  has_many :comments, dependent: :destroy

end
