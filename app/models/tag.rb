class Tag < ActiveRecord::Base
  has_many :tagged_posts, :class_name => 'PostTagging'
  has_many :posts, :through => :tagged_posts
  has_many :authors_of_tagged_posts, source: :authors, through: :posts

end
