Rails.application.routes.draw do

  resources :posts 

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
  
end
