Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users
  end

  root 'congressmembers#index'
  resources :congressmembers do
  end
end
