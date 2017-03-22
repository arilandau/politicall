Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resource :lists
  end

  namespace :admin do
    resources :users
  end

  root 'congressmembers#index'
  resources :congressmembers do
  end
end
