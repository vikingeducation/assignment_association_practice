class Post < ApplicationRecord

  belongs_to :category

  has_many :post_authorings, dependent: :destroy
  has_many :users, through: :post_authorings
  has_many :authors, :through => :post_authorings, :source => :user

end
