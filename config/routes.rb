Rails.application.routes.draw do
  root 'projects#index'

  resources :projects
  resources :tickets
  resources :tags
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

end
