Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :projects
  resources :propositions, only: [:index, :new, :create]
  resources :users, only: [:index, :edit, :update]
end
