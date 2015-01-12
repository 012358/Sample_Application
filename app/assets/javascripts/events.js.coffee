# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
  calendar=$('#calendar').fullCalendar({
    height: 570
    editable: true,
    droppable: true,
    draggable: true,
    durationEditable: true,
    eventStartEditable: true,
    eventDurationEditable: true,
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,basicWeek,basicDay'
    }
    eventSources: [
      {
        url: '/events.json',
        type: 'GET',
      #color: '#CBE2FA',
        allDay: false,
        borderColor: '#bccee0',
        textColor: 'black'
        error: ->
          alert('there was an error while fetching events!')
      }
    ]

    eventDrop: (event) ->
        $.ajax({
          dataType: 'script',
          type:"PATCH",
          url: "/events/"+event.id,
          data:
            event:
              title: event.title,
              calendar_id: event.calendar_id,
              start: event.start.format(),
              end: event.end.format()
        });

    eventClick: (event) ->
      window.open('/events/'+event.id)
  });
