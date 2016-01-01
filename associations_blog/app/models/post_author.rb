class PostAuthor < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :author, class_name: 'User'
end
