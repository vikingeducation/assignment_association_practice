class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy, inverse_of: :parent_post
  has_many :tags, through: :post_taggings
  has_many :authors, through: :post_authorings, class_name: "User"
  has_many :post_authorings, :dependent => :destroy, class_name: "UserPost"

  has_many :post_taggings, :dependent => :destroy, class_name: "PostTag"
  belongs_to :category

  accepts_nested_attributes_for :comments,
    #reject_if: proc { |attributes| attributes['body'].blank? },
    reject_if: :all_blank,
    :allow_destroy => true
end
