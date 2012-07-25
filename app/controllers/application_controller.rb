class ApplicationController < ActionController::Base
  #before_filter :authenticate_user!

  protect_from_forgery

  def current_user
    User.first
  end
  def sign_out_path_for
    root_path
  end
end
