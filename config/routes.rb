Rails.application.routes.draw do
  root 'congressmembers#index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :congressmembers, only: [:index]
    end
  end

  resources :congressmembers, except: [:index]

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
