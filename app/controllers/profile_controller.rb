class ProfileController < ApplicationController
  def show
    @user = current_user
    render :manage
  end
  def manage
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to :show_my_profile, :notice => 'Profile updated successfully!'
    else
      render :show
    end
  end
end
