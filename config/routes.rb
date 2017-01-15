Rails.application.routes.draw do

  resources :posts, :only => [:new, :create, :edit, :update, :show]
  
end
