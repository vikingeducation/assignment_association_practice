class UsersController < ApplicationController
  has_many :comments
  has_many :posts

end
