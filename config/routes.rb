Moviemates::Application.routes.draw do

  resources :mates do
    collection { get "pending" }
    collection { get "blocked" }
    member { get "invite" }
    member { put "accept" }
    member { put "block" }
    member { put "unblock" }
    member { put "remove" }
    collection { get "search" }
  end


  #resources :users
  resources :reviews, :only => [:new, :index] do

  end


  resources :movies do
    collection { get 'suggestions', :to => 'ajax#movie_suggestions' }
    collection { get 'latest' }
    member { get 'new_review', :to => 'reviews#new' }
    member { post 'new_review', :to => 'reviews#create' }
  end

  resources :profiles do
    member { get 'manage' }
    member { put 'manage', :action => :update }
  end

  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

  root :to => 'home#index'

end
