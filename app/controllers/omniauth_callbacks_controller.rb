class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model
    data = request.env["omniauth.auth"]
    @user = User.find_for_facebook_oauth(data, current_user)
    Authorization.find_for_authorization(@user, {
      :provider => data.provider,
      :uid => data.uid,
      :token => data.credentials.token,
      :token_expiry => data.credentials.expires_at.to_s,
      :link => data.link,
    })

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


end