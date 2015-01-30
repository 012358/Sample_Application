# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "mousedown", '.context-menu-one', (event) ->
  $.contextMenu
    selector: ".context-menu-one"
    callback: (key, options) ->
      window.location.href = "/events"  if key is "show"
      $(".small.modal").modal "show"  if key isnt "" and key isnt "show"


    items:
      show:
        name: "Go to Calendar"

      edit:
        name: "Edit"

      copy:
        name: "Copy"

      paste:
        name: "Paste"

      delete:
        name: "Delete"

      sep1: "---------"
      quit:
        name: "Quit"

