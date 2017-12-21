class Category < ApplicationRecord

  has_many :posts

  def self.dropdown
    all.order('name ASC')
  end

end
