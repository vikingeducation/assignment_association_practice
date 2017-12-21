class Post < ApplicationRecord

  belongs_to :category

  has_many :user_posts, dependent: :destroy
  has_many :users, through: :user_posts
  has_many :authors, through: :user_posts, source: :user

  has_many :post_authorings, class_name: 'UserPost', dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :post_taggings, class_name: 'Tagging', dependent: :destroy

  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  validates :title, :body, :category, presence: true

end
