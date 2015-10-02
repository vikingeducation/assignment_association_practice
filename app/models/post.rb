class Post < ActiveRecord::Base

  belongs_to :category

  has_many :post_taggings,
  :foreign_key => "post_id",
  :class_name => "Pt",
  :dependent => :destroy

  has_many :post_authorings,
   :foreign_key => "post_id",
   :class_name => "Pu",
   :dependent => :destroy

  has_many :authors,
  :through => :post_authorings,
  :source => :user,
  :dependent => :destroy

  has_many :tags,
   :through => :post_taggings,
   :dependent => :destroy

  has_many :comments,
  :dependent => :destroy
  accepts_nested_attributes_for :comments,
                    reject_if: :all_blank,
                    allow_destroy: true

end
