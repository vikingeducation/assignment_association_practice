class Tag < ActiveRecord::Base
  has_many :post_taggings, class_name: "Tagging"
  # can't do dependent: :destroy because they do SELECTs back and forth FOREVER
  has_many :tagged_posts, through: :post_taggings, dependent: :destroy
  has_many :authors_of_tagged_posts, through: :tagged_posts, source: :authors
end
