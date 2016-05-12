Rails.application.routes.draw do
  
  resources :products

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
  
end
