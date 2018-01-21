# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"

  resources :home, only: %i[index]
  resources :posts, only: %i[index show]
  resources :about, only: %i[index]
  resources :subscribe, only: %i[create]

  namespace :admin do
    resources :categories
    resources :images
    resources :posts

    root to: "posts#index"
  end
end
