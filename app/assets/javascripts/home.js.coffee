# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.tabbox:first').show()
  $('#tab li:first').addClass('active')
  $('#tab li').click ->
    $('#tab li').removeClass('active')
    $(this).addClass('active')
    $('.tabbox').hide()
    $($(this).find('a').attr('href')).fadeIn()
    return false
