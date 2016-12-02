Rails.application.routes.draw do
  
  resources :posts, only: [:new, :edit, :show]

end
