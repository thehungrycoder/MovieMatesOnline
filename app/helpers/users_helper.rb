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

  def get_user_avatar(user, options = {})
    return unless user.present?
    options[:height] ||= '20px'
    options[:width] ||= '20px'
    image_tag(get_user_avatar_url(user), :height => options[:height], :width => options[:width])
  end
end
