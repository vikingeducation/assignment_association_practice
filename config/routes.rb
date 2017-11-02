Rails.application.routes.draw do
  resources :post, only: [:new, :edit]
end
