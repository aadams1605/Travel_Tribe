Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events do
    resources :requests, only: :create
  end
  get "accounts/show", to: "accounts#show"
  resources :users, only: [:index, :show]
end
