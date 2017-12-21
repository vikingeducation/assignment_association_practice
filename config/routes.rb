Rails.application.routes.draw do

  root 'posts#index'

  resources :posts, only: [:new, :create, :edit, :update, :show]
end
