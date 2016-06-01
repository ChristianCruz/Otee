Rails.application.routes.draw do

  get 'comments/create'


  resources :posts do
    
    resources :comments, only: [:create, :destroy]

    # These lines set up POST routes at the URL posts/:id/up-vote
    # and posts/:id/down-vote. The as key-value pairs at the end
    # stipulate the method names which will be associated with
    # these routes: up_vote_path and down_vote_path
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
  
end
