class Post < ActiveRecord::Base
  belongs_to :category
  has_many :post_authors
  has_many :authors, through: :post_authors, source: :users
end
