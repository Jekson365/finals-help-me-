Rails.application.routes.draw do
  resources :subjects
  resources :lectures do
    resources :requests
  end
  resources :requests
  resources :subjects do
    resources :lectures
  end
  # resources :users
  get "/users",to: "users#index"
  devise_for :users,controllers: {
    sessions:"users/sessions"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "homes#index"

  resources :questions
  # Defines the root path route ("/")
  # root "articles#index"
end
