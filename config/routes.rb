Rails.application.routes.draw do

  root 'posts#index'

  resources :post, only: [:new, :create, :edit, :update, :show]
end
