Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :comments
  resources :posts
  resources :categories
  resources :tags
  root 'post#index'
end
