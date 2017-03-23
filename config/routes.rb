Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :prestation_orders
  get 'welcome/index'
  root 'welcome#index'
  get '/galerie' => 'galeries#index'
  get '/prestations' => 'prestations#index'
  resources :galeries, only: [:index, :new, :create]
end
