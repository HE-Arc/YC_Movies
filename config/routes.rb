Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :prestation_orders, :except => [:edit, :destroy, :update, :index, :show]
  get '/prestation_orders/new/step:step_number' => 'prestation_orders#new'
  get 'welcome/index', as: 'show_welcome'
  root 'welcome#index'

  get '/galerie' => 'galeries#index', as: 'show_galery'
  get '/about' => 'welcome#about'
  get '/prestations' => 'prestations#index'
  get "/show_categories/:id" => 'galeries#show_categories', as: 'show_categories'
  get "/show_categories_all" => 'galeries#show_categories_all', as: 'show_categories_all'
  get "/success" => 'prestation_orders#success', as: 'show_prestation_success'
 # resources :galeries, only: [:index, :new, :create]

end
