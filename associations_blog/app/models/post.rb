class Post < ActiveRecord::Base
  belongs_to :category
  has_many :post_authors, dependent: :destroy

  # Un-renamed version
  # has_many :users, through: :post_authors, foreign_key: :author_id

  # Semantically named version
  has_many :authors, through: :post_authors, source: :user

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  has_many :comments, dependent: :destroy
end
