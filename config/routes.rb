Rails.application.routes.draw do

  root 'posts#new'

  resources :posts

  # get 'posts/index'

  # get 'posts/show'

  # get 'posts/new'

  # get 'posts/create'

  # get 'posts/edit'

  # get 'posts/update'

end
