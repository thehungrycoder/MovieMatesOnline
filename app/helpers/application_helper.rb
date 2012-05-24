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

end
