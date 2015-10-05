$(document).on 'ready page:load page:change', ->

  $(document).on "mousedown", '.context-menu-one', (event) ->
    input = $(event.target)
    $.contextMenu('destroy',  ".context-menu-one" );
    $.contextMenu
      selector: ".context-menu-one"
      callback: (key, options) ->
        window.location.href = "/events"  if key is "calendar"
        window.location.href = input.attr("data-url")  if key is "url"
#        $(".small.modal").modal "show"  if key isnt "" and key isnt "show"


      items:
        calendar:
          name: "Go to Calendar"

        url:
          name: 'Project Url'

