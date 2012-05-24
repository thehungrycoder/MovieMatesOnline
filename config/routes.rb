Moviemates::Application.routes.draw do

  resources :reviews

  scope :movies do
    match '/movies/latest', :to => 'movies#latest', :as => 'latest_movies'
    resources :movies
    get '/movie/:movie_id/new_review', :to => 'reviews#new', :as => 'new_movie_review'
    post '/movie/:movie_id/new_review', :to => 'reviews#create', :as => 'new_movie_review'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  root :to => 'home#index'


end
