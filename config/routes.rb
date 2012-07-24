Moviemates::Application.routes.draw do

  get "mates/index"
  get "mates/pending"
  get "mates/invite"
  put "mates/:mate_id/accept" => 'mates#accept', :as => 'friendship_accept'
  put "mates/:mate_id/block" => 'mates#block', :as => 'friendship_block'

  #resources :users
  resources :reviews
  get 'movies/suggestions', :to => 'ajax#movie_suggestions'

  scope :movies do
    match '/movies/latest', :to => 'movies#latest', :as => 'latest_movies'
    resources :movies
    get '/movie/:movie_id/new_review', :to => 'reviews#new', :as => 'new_movie_review'
    post '/movie/:movie_id/new_review', :to => 'reviews#create', :as => 'new_movie_review'
  end

  get '/profile/manage', :to => 'profile#show', :as => 'show_my_profile'
  put '/profile/manage', :to => 'profile#manage', :as => 'manage_my_profile'

  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

  root :to => 'home#index'


end
