# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

(($) ->
  $('#movie_trailer').youTube({
    videoHeader : null,
    results : 1,
    orderBy : null,
    query : $('.title').text() + ' official trailer',
    author : null,
    showRatings : false,
    showNumRatings : false,
    showViews : false,
    showDescription : false,
    descriptionLength : null
  })

)(jQuery)