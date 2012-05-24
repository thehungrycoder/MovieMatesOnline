class AjaxController < ApplicationController
  layout :none

  def movie_suggestions
    term = params[:term]
    search = Movie.search do
      with(:is_public, true)
      fulltext(term)
    end

    movies = Array.new
    search.results.each do |movie|
      movies.push(
        {
          label: "#{movie.name} (#{movie.released}",
          value: "#{movie.name} (#{movie.released}",
          id: movie.id,
        })
    end

    respond_to do |format|
      format.json { render json: movies }
    end
  end
end
