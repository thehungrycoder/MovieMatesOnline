jQuery ($) ->
  cache = {}
  $('#review_movie').autocomplete {
    minLength: 3
    source: (request, response) ->
      term = request.term
      if term in cache
        return response(cache[term])
      lastXhr = $.getJSON('/movies/suggestions.json', request, (data, status, xhr ) ->
        cache[term] = data;
        if xhr == lastXhr
          response data
      )
    ,
    select: (event, ui) ->
      $('#review_movie_id').val(ui.item.id)
  }


