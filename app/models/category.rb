class Category < ActiveRecord::Base
  has_many :posts

  before_destroy :dissociate

  def dissociate
    posts.where('category_id = ?', id)
      .update('category_id = NULL')
  end
end
