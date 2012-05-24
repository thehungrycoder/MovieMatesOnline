File.open(Rails.root.join('meta_movie.yml')) do |file|
  YAML::load(file).each do |movie|
    movie.symbolize_keys!
    movie_data = {
      :name => movie[:name],
      :overview => movie[:overview],
      :duration => movie[:runtime],
      :is_public => movie[:display],
      :imdbid => movie[:imdbid],
      :imdb_rating => movie[:imdb_rating],
      :certificate => movie[:certificate],
      :released => movie[:released],
      :cover_image => movie[:cover_image]
    }

    Movie.find_or_create_by_imdbid(movie_data)

  end
end