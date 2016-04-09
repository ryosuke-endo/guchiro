# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.is-disable').find('.sympathy-message').text(I18n.t('owner_sympathy'))
  $('.on').find('.sympathy-message').text(I18n.t('sympathied'))
  $('.sympathy_button').on 'click', ->
    sympathy_class = $(this).attr('class').split(' ')
    grumble_id = $(this).attr('id').split(' ')
    sympathy_switch = sympathy_class[3]
    noop = jQuery.noop
    switch sympathy_switch
      when 'signin_required'
        Sympathy.redirect()
      when 'is-owner'
        noop
      when 'on'
        Sympathy.off(grumble_id)
      else
        Sympathy.on(grumble_id)

@Sympathy =
  redirect: ->
    window.location = '/login'

  on: (grumble_id) ->
    before_count = parseInt $(".sympathy_count-#{grumble_id}").text()
    count = before_count + 1
    sympathy_count = ".sympathy_count-#{grumble_id}"
    change_class = ".grumble_sympathy-#{grumble_id}"
    text = ".sympathy_count-text-#{grumble_id}"
    path = window.location.pathname
    if path == "/"
      url = "grumbles/#{grumble_id}/sympathies"
    else
      url = "#{grumble_id}/sympathies"
    $.ajax
      type: 'POST'
      url: url
      id: grumble_id
      success: ->
        $(text).text(I18n.t('sympathied'))
        $(sympathy_count).text(count)
        $(change_class).removeClass('off')
        $(change_class).addClass('on')
      error: ->
        $(text).text(I18n.t('fail'))

  off: (grumble_id) ->
    before_count = parseInt $(".sympathy_count-#{grumble_id}").text()
    count = before_count - 1
    sympthy_count = ".sympathy_count-#{grumble_id}"
    change_class = ".grumble_sympathy-#{grumble_id}"
    text = ".sympathy_count-text-#{grumble_id}"
    path = window.location.pathname
    if path == "/"
      url = "grumbles/#{grumble_id}/sympathies/#{grumble_id}"
    else
      url = "#{grumble_id}/sympathies/#{grumble_id}"
    $.ajax
      type: 'DELETE'
      url: url
      id: grumble_id
      success: ->
        $(text).text(I18n.t('sympathy'))
        $(sympthy_count).text(count)
        $(change_class).removeClass('on')
        $(change_class).addClass('off')
      error: ->
        $(text).text(I18n.t('fail'))
