Rails.application.routes.draw do
  root 'projects#index'

  resources :projects
  resources :tickets do
    resources :comments
  end
  resources :tags
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]

end
