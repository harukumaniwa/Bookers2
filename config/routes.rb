Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => "homes#about"
  resources :users
  resources :books
  post 'books/:id', to: 'books#create'
  post 'users', to: 'books#create'
  post 'users/:id', to: 'books#create'
  patch 'users/:id/edit', to: 'users#update'
end
