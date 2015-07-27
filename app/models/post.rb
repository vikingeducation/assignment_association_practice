class Post < ActiveRecord::Base
  has_many :comments

  has_many :authors, through: :authorship, :foreign_key => :user_id
end
