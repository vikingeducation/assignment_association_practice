class Post < ActiveRecord::Base
  has_many :comments,  :dependent => :destroy

  accepts_nested_attributes_for :comments,
                                :reject_if => :all_blank,
                                :allow_destroy => true
  has_many :post_authorings, :class_name => "Authorship", :dependent => :nullify
  has_many :post_taggings, :class_name => "Tagging", :dependent => :nullify
  has_many :tags, :through => :post_taggings, :dependent => :nullify

  has_many :authors, :through => :post_authorings, source: :user , :dependent => :nullify
end
