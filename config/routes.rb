Moviemates::Application.routes.draw do


  scope :movies do
    match '/movies/latest', :to => 'movies#latest', :as => 'latest_movies'
    resources :movies
  end

  devise_for :users

  root :to => 'home#index'
  #resources :authentications

  #match '/auth/:provider/callback' => 'authentications#create'

end
