# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts, only: %i[show]
  resources :about, only: %i[index]

  namespace :admin do
    resources :categories
    resources :images
    resources :posts

    root to: "posts#index"
  end
end
