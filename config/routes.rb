Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :propositions do
    resources :projects
  end
  resources :users, only: [:index, :edit, :update]
end
