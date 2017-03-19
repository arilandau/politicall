Rails.application.routes.draw do
  devise_for :users
  root 'congressmembers#index'
  resources :congressmembers do
  end
end
