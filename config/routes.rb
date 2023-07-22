# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :prefectures, only: [:index]
    get :user, to: 'user#index'
  end
end
