Moviemates::Application.routes.draw do


  scope :movies do
    match '/movies/latest', :to => 'movies#latest', :as => 'latest_movies'
    resources :movies
  end

  devise_for :users #, :path => "accounts" #, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  root :to => 'home#index'
  #resources :authentications

  resources :users

  #match '/auth/:provider/callback' => 'authentications#create'

end
