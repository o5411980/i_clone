Rails.application.routes.draw do
  resources :pictures
  root to: 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
end
