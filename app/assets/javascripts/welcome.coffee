# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).scroll ->
  if $(document).scrollTop() > 50
    $('nav').addClass 'shrink'
    $('.navbar-nav').addClass 'shrink'
  else
    $('nav').removeClass 'shrink'
    $('.navbar-nav').removeClass 'shrink'
  return