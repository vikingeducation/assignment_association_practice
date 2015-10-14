class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :post_authorings, :class_name => 'UserPosting'
  has_many :authors, :through => :post_authorings, :class_name => 'User', :source => :user
  has_many :post_taggings
  has_many :tags, :through => :post_taggings

  accepts_nested_attributes_for :comments,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  before_destroy :dissociate

  def dissociate
    comments.destroy_all
    post_authorings.destroy_all
    post_taggings.destroy_all
  end
end
