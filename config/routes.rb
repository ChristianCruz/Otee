Rails.application.routes.draw do

  get 'comments/create'

  resources :posts do
    resources :comments, only: [:create]
  end

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
  
end
