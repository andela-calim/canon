# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
flashCallback = (_this) ->
  $('.flash').fadeOut()
  return

$('document').ready ->
  $('.datepicker').pickadate
    formatSubmit: 'yyyy/mm/dd'
    hiddenName: true
    min: 1
    max: 30

  $('#check-all').on 'click', ->
    $('.ra-error').html('')
    checkboxes = $('.check-box')
    checkboxes.prop 'checked', !checkboxes.prop('checked')
    return

  $('.flash').bind 'click', (e) ->
    flashCallback()
    return
  setTimeout flashCallback, 3000
  return