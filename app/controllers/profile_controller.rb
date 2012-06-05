class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
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

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to :show_my_profile, :notice => 'Profile updated successfully!'
    else
      render :show
    end
  end
end
