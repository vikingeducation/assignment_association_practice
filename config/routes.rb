Rails.application.routes.draw do
  root 'posts#new'
  resources :posts, except: [:index, :destroy]
end
