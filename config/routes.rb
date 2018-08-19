Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  ##resources :photos, only: [:create, :destroy]
  
  post 'articles/upload'
  get 'articles/download'

  resources :photos, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :comments, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
