Rails.application.routes.draw do
  resources :prestation_orders
  get 'welcome/index'
 
  root 'welcome#index'
  get '/galerie' => 'galerie#index'
  get '/prestations' => 'prestations#index'
end
