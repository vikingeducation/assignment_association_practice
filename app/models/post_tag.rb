class PostTag < ActiveRecord::Base
  belongs_to :tagged_post
  belongs_to :tag

  has_many :user_posts, :through => :user_post_tag
  
end
