class Post < ApplicationRecord
    has_many :comments
    has_many :users, :foreign_key => :author_id

    has_many :post_tags
    has_many :tags, :through => :post_tags
    accepts_nested_attributes_for :tags, :reject_if => :all_blank, :allow_destroy => :true

    has_many :user_posts, foreign_key: :post_id
    has_many :authors, through: :user_posts, source: :user

    belongs_to :category, optional: true
    accepts_nested_attributes_for :category, :reject_if => :all_blank, :allow_destroy => :true
end
