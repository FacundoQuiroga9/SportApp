Rails.application.routes.draw do
  devise_for :users

  resources :exercises
  resources :routines

  root 'home#index'
end
