Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events
  get "accounts/show", to: "accounts#show"
  resources :users, only: [:index, :show]
end
