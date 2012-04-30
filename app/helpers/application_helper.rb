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
      path =  Rails.root.join('system','movie_cover_image',poster)
      raise path.inspect
      raise File.exists?(path).inspect
      return path if File.exists?(path)
    end
    nil
  end
end
