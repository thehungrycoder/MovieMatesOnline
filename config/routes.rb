Moviemates::Application.routes.draw do

  scope '/mates' do
    get "index", :to => 'mates#index'
    get "pending", :to => 'mates#pending'
    get "invite/:id", :to => 'mates#invite', :as => 'friendship_request'
    put ":mate_id/accept" => 'mates#accept', :as => 'friendship_accept'
    put ":mate_id/block" => 'mates#block', :as => 'friendship_block'
    put ":mate_id/remove" => 'mates#remove', :as => 'friendship_remove'
    get "search" => 'mates#search', :as => 'mates_search'
  end


  resources :reviews
  get 'movies/suggestions', :to => 'ajax#movie_suggestions'

  scope :movies do
    match '/movies/latest/(:page)', :to => 'movies#latest', :as => 'latest_movies'
    resources :movies
    get '/movie/:movie_id/new_review', :to => 'reviews#new', :as => 'new_movie_review'
    post '/movie/:movie_id/new_review', :to => 'reviews#create', :as => 'new_movie_review'
  end

  scope '/profile' do
    get 'manage', :to => 'profile#manage', :as => 'manage_my_profile'
    put 'manage', :to => 'profile#update', :as => 'manage_my_profile'
    get 'show/:id', :to => 'profile#show', :as => 'show_profile'
  end

  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

  root :to => 'home#index'

end
