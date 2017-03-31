Rails.application.routes.draw do
  root 'congressmembers#index'
  devise_for :users

  resources :congressmembers

  resources :users do
    resources :lists
  end

  resources :lists do
    resources :congresslists
  end

  namespace :admin do
    resources :users
  end

  resources :congressmembers
end
