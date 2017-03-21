Rails.application.routes.draw do
  resources :prestation_orders
  get '/prestation_orders/new/step:step_number' => 'prestation_orders#new'
  get 'welcome/index'
 
  root 'welcome#index'
  get '/galerie' => 'galerie#index'
end
