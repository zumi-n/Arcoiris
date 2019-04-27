Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :projects
  resources :users, only: [:index, :edit, :update]
end
