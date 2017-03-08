# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#Override " $ -> " of jquery
jQuery.fn.ready = (fn)->
  $(this).on 'turbolinks:load', fn

#$(document).on 'turbolinks:load', ->
$ ->
  $('#logo_navbar').hover ->
    $('#logo_gif_navbar').css 'background-image', "url('assets/Logo_anime.gif?" + Math.random() + "')"
    setTimeout ->
      $('#logo_gif_navbar').css 'background-image', ""
      return
    , 2200
  , ->
    $('#logo_gif_navbar').css 'background-image', ""
  return


$(window).scroll ->
  if $(document).scrollTop() > 50
    $('nav').addClass 'shrink'
    $('.navbar-nav').addClass 'shrink'
  else
    $('nav').removeClass 'shrink'
    $('.navbar-nav').removeClass 'shrink'
  return
