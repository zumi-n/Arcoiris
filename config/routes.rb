Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :profiles, only: [:index, :edit, :update]
  resources :propositions do
    resources :projects
  end
  get 'lists' => 'propositions#list'
  resources :users, only: [:index, :edit, :update]
end
