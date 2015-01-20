# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  $(document).on 'click', '.bill_check_box', (event) ->
    input = $(event.target)
#    alert('aaaaa')
    $.ajax
      dataType: 'script'
      type: 'GET'
      url: input.attr("data-load-event-url")
