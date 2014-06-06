Rails.application.routes.draw do

  get 'password_resets/new'

  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root :to => "site#index"
  resources :users
  resources :sessions
  resources :password_resets


  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :dashboard
end
