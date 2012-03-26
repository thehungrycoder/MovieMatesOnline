Moviemates::Application.routes.draw do

  get "home/index"

  devise_for :users, :path => "accounts", :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  root :to => 'home#index'
  #resources :authentications

  resources :users

  #match '/auth/:provider/callback' => 'authentications#create'

end
