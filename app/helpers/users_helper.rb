module UsersHelper
  def get_gravatar_url(email)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=30"
  end

  def get_user_avatar_url(user)
    if user.avatar_url.present?
      user.avatar_url.to_s
    else
      get_gravatar_url(user.email)
    end
  end

  def get_user_avatar(user)
    return unless user.present?
    image_tag(get_user_avatar_url(user), :height => '30', :width => '30')
  end
end
