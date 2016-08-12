class Tag < ApplicationRecord
  has_and_belongs_to_many :tagged_posts, :class_name => "Post",
      :join_table => :post_tags

  has_many :authors_of_tagged_posts, :through => :tagged_posts,
          :source => :authors
end
