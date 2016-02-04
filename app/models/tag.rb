class Tag < ActiveRecord::Base
  has_many :tagged_posts, through: :post_tags, class_name: "Post"
  has_many :post_taggings, :dependent => :destroy, class_name: "PostTag"
  
  #has_many :authors_of_tagged_posts, through: :user_tags, class_name: "User"
  has_and_belongs_to_many :authors_of_tagged_posts, class_name: "User"
end
