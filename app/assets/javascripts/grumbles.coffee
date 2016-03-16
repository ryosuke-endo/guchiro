$ ->
  grumblepost = new Grumblepost
  grumblepost.disable()
  $('.grumble-textarea').bind 'keyup', ->
    textcount = $(this).val().length
    $('.textcount').html(textcount)
    if 0 < textcount && textcount <= 250
      grumblepost.able()
      grumblepost.alert_off()
    else
      grumblepost.disable()
      grumblepost.alert_on()

class Grumblepost
  disable: ->
    $('.grumble-button').prop('disabled', true).addClass('disabled')
  able: ->
    $('.grumble-button').prop('disabled', false).removeClass('disabled')
  alert_on: ->
    $('.textcount').addClass('alert-text')
  alert_off: ->
    $('.textcount').removeClass('alert-text')
