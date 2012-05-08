Moviemates::Application.routes.draw do

  scope :movies do
    get '/movies/latest', :to => 'movies#index', :as => 'latest_movies'
    resources :movies
  end
  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

  root :to => 'home#index'
end
