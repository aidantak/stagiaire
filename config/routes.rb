Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'stages/index'
  get 'stages/show'
  get 'dashboard/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
  end

  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  get '/users/:id', to: 'profiles#show', as: :user_profile
  resources :stages, only: [:index, :show]
end
