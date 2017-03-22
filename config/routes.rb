Rails.application.routes.draw do
  root 'congressmembers#index'
  devise_for :users

  resources :users do
    resource :lists
  end

  namespace :admin do
    resources :users
  end

  resources :congressmembers do
  end
end
