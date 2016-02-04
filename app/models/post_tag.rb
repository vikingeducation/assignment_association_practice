class PostTag < ActiveRecord::Base
  belongs_to :tagged_post, class_name: "Post", foreign_key: :post_id
  belongs_to :tag

  validates :post_id, :uniqueness => { :scope => :tag_id }
end
