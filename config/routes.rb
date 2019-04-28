Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :profiles, only: [:index, :edit, :update]
  get 'lists' => 'propositions#list'
  resources :propositions do
    resources :projects
  end
  resources :users, only: [:index, :edit, :update]
end
