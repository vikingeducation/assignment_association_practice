class Tag < ActiveRecord::Base
  has_many :post_taggings, foreign_key: :tag_id, class_name: "PostTag"
  has_many :tagged_posts, :through => :post_taggings, source: :post
  # has_and_belongs_to_many :authors_of_tagged_posts, foreign_key: :tag_id, join_table: :user_taggings, source: :user
end
