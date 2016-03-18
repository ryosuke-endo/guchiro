$ ->
  Grumblepost.disable()
  $('.grumble-textarea').bind 'keyup', ->
    textcount = $(this).val().length
    $('.textcount').html(textcount)
    if 0 < textcount && textcount <= 250
      Grumblepost.able()
      Grumblepost.alert_off()
    else
      Grumblepost.disable()
      Grumblepost.alert_on()

@Grumblepost =
  disable: ->
    $('.grumble-button').prop('disabled', true).addClass('disabled')
  able: ->
    $('.grumble-button').prop('disabled', false).removeClass('disabled')
  alert_on: ->
    $('.textcount').addClass('alert-text')
  alert_off: ->
    $('.textcount').removeClass('alert-text')
