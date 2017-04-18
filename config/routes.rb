Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :prestation_orders
  get '/prestation_orders/new/step:step_number' => 'prestation_orders#new'
  get 'welcome/index'
  root 'welcome#index'

  get '/galerie' => 'galeries#index'
  get '/prestations' => 'prestations#index'
  get "/show_videos" => 'galeries#show_videos', as: 'show_videos'
  get "/show_images" => 'galeries#show_images', as: 'show_images'
  get "/show_both" => 'galeries#show_both', as: 'show_both'
  get "/show_categories/:id" => 'galeries#show_categories', as: 'show_categories'
 # resources :galeries, only: [:index, :new, :create]

end
