module ApplicationHelper
  def pagination_links(collection, options = {})
    options[:renderer] ||= BootstrapPaginationHelper::LinkRenderer
    options[:class] ||= 'pagination pagination-centered'
    options[:inner_window] ||= 2
    options[:outer_window] ||= 1
    will_paginate(collection, options)
  end

  def get_movie_poster_path(poster)
    if poster.present?
      path = Rails.root.join('public', 'system', 'movie_cover_images', poster)
      if File.exists?(path)
        return "/system/movie_cover_images/#{poster}"
      end
    end
    'film.png'
  end

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
