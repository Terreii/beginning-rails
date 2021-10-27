Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "articles#index"
  resources :articles do
    member do
      post :notify_friend
    end
    resources :comments
  end
  resources :users
  resource :session
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"
end
