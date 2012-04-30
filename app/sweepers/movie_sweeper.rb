class MovieSweeper < ActionController::Caching::Sweeper
  observe Movie

  def sweep(movie)
    expire_page latest_movies_path
    expire_page movie_path(movie.id)
  end

  alias_method :after_update, :sweep
end