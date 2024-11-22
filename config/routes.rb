Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  devise_for :users
  resources :books, only: [:index, :show, :create, :edit, :update,:destroy] do
    resource :favorite ,only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
