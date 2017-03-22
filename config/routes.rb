Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :prestation_orders
  get 'welcome/index'
 
  root 'welcome#index'
  get '/galerie' => 'galerie#index'
  get '/prestations' => 'prestations#index'
end
