Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events do
    resources :requests, only: :create
  end
  resources :chatrooms, only: [:show, :create, :index] do
    resources :messages, only: [:new, :create]
  end

  resources :requests, only: :destroy
  get "accounts/show", to: "accounts#show", as: "dashboard"
  patch "/requests/:id/accept", to: "requests#accept", as: "accept"
  patch "/requests/:id/reject", to: "requests#reject", as: "reject"
  resources :users, only: [:index, :show] do
    resources :notifications, only: :index, as: "notifications"
  end
  get '/search', to: 'application#search'
end
