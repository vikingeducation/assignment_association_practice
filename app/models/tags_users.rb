class TagUser < ActiveRecord::Base
  belongs_to :tagged_author, class_name: "User", foreign_key: :user_id
  belongs_to :tag

  validates :user_id, :uniqueness => { :scope => :tag_id }
end
