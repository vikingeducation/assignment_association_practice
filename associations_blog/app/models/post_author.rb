class PostAuthor < ActiveRecord::Base
  belongs_to :post

  # Un-semantically named version
  belongs_to :user, foreign_key: :author_id

  # Semantically named
  belongs_to :author, class_name: 'User'
end
