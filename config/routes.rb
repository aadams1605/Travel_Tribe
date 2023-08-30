Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events do
    resources :requests, only: :create
  end
  get "accounts/show", to: "accounts#show", as: "dashboard"
  patch "/requests/:id/accept", to: "requests#accept", as: "accept"
  patch "/requests/:id/reject", to: "requests#reject", as: "reject"
  resources :users, only: [:index, :show]
end
