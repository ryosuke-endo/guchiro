$ ->
  $('.grumble-textarea').bind 'keyup', ->
    textcount = $(this).val().length
    $('.textcount').html(textcount)
    if 0 < textcount && textcount <= 250
      $('.grumble-button').prop('disabled', false).removeClass('disabled')
    else
      $('.grumble-button').prop('disabled', true).addClass('disabled')
  $('.grumble-button').prop('disabled', true).addClass('disabled')
