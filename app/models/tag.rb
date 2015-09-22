class Tag < ActiveRecord::Base

  has_many :post_taggings,
  :foreign_key => "tag_id",
  :class_name => "Pt"

  has_many :tagged_posts,
  :source => :post,
  :through => :post_taggings,
  :dependent => :destroy

  has_many :authors_of_tagged_posts,
  :through => :tagged_posts,
  :source => :authors

end
