Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :propositions do
    resources :projects
  end
  get 'lists' => 'propositions#list'
  resources :groups
  resources :users, only: [:index, :edit, :update] do
    collection do
      get :list
      get :followlist
    end
    member do
      post :follow
      post :unfollow
    end
  end
end
