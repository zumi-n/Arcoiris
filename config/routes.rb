Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :propositions do
    resources :projects
  end
  get 'lists' => 'propositions#list'
  resources :groups
  resources :users, only: [:index, :edit, :update]
end
