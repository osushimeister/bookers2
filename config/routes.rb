Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  get '/users', to: 'users#index'
  devise_for :users
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :top, :about]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
