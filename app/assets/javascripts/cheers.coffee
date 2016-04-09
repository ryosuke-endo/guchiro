# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.is-disable').find('.cheer-message').text(I18n.t('owner_cheer'))
  $('.on').find('.cheer-message').text(I18n.t('cheered'))
  $('.cheer_button').on 'click', ->
    cheer_class = $(this).attr('class').split(' ')
    grumble_id = $(this).attr('id').split(' ')
    cheer_switch = cheer_class[3]
    noop = jQuery.noop
    switch cheer_switch
      when 'signin_required'
        Cheer.redirect()
      when 'is-owner'
        noop
      when 'on'
        Cheer.off(grumble_id)
      else
        Cheer.on(grumble_id)

@Cheer =
  redirect: ->
    window.location = '/login'

  on: (grumble_id) ->
    before_count = parseInt $(".cheer_count-#{grumble_id}").text()
    count = before_count + 1
    cheer_count = ".cheer_count-#{grumble_id}"
    change_class = ".grumble_cheer-#{grumble_id}"
    text = ".cheer_count-text-#{grumble_id}"
    path = window.location.pathname
    if path == "/"
      url = "grumbles/#{grumble_id}/cheers"
    else
      url = "#{grumble_id}/cheers"
    $.ajax
      type: 'POST'
      url: url
      id: grumble_id
      success: ->
        $(text).text(I18n.t('cheered'))
        $(cheer_count).text(count)
        $(change_class).removeClass('off')
        $(change_class).addClass('on')
      error: ->
        $(text).text(I18n.t('fail'))

  off: (grumble_id) ->
    before_count = parseInt $(".cheer_count-#{grumble_id}").text()
    count = before_count - 1
    cheer_count = ".cheer_count-#{grumble_id}"
    change_class = (".grumble_cheer-#{grumble_id}")
    text = ".cheer_count-text-#{grumble_id}"
    path = window.location.pathname
    if path == "/"
      url = "grumbles/#{grumble_id}/cheers/#{grumble_id}"
    else
      url = "#{grumble_id}/cheers/#{grumble_id}"
    $.ajax
      type: 'DELETE'
      url: url
      id: grumble_id
      success: ->
        $(text).text(I18n.t('cheer'))
        $(cheer_count).text(count)
        $(change_class).removeClass('on')
        $(change_class).addClass('off')
      error: ->
        $(text).text(I18n.t('fail'))
