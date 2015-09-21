# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  $(document).on 'click', '.bill_check_box', (event) ->
    input = $(event.target)
    $.ajax
      dataType: 'script'
      type: 'GET'
      url: input.attr("data-load-event-url")

#  $(document).on 'dblclick', '#paragraph', -> # DOUBLE Click
#    $("*").hide();

#  $(document).on 'mouseenter', '#paragraph', ->
#    alert('Mouse On Paragraph ...')

#  $(document).on 'mouseleave', '#paragraph', ->
#    alert("sdasdas")
  $('.text_field').focus()

  $('#paragraph').delegate 'p.delegate', 'click', ->
    $('p').css 'background-color', 'pink'

  $('p.delegate').on 'click',(event) ->
    alert($(event.target).attr("daata"))

  $(document).on 'click', 'p.hide', ->
    $(this).hide(2000)

  $(document).on 'click', 'button', ->
    $('.text_field').toggle(1000)

  $(document).on 'click', '.animation', ->
    $('#paragraph').animate({height: "300px"}, 3000)

