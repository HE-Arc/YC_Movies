Rails.application.routes.draw do
  get 'welcome/index'
 
  root 'welcome#index'
  get '/galerie' => 'galerie#index'
end
