Rails.application.routes.draw do
  # get 'favorites/create'
  # get 'favorites/destroy'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => "homes#about"
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end
  post 'books/:id', to: 'books#create'
  post 'users', to: 'books#create'
  post 'users/:id', to: 'books#create'
  patch 'users/:id/edit', to: 'users#update'
  get "books/:id/favorites" => "books#index"
end
