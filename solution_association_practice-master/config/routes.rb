Rails.application.routes.draw do
  resources :static_pages, :only => [:index, :update]
  resources :posts
  root :to => 'posts#index'
end
