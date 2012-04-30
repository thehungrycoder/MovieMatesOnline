class ApplicationController < ActionController::Base
  #before_filter :authenticate_user!
  helper :bootstrap_pagination
  protect_from_forgery
end
