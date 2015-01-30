$(document).on "page:change", ->

  # apply select2(taggable) in events form for calendar column(support for searching).
  $('.single-field').each ->
    $(this).select2
      data: $(this).data('options')
      width: "252px"
      multiple: false

  # Show Calendar(full calendar jQuery) in event index page against #calendar id.
  calendar=$('#calendar').fullCalendar({
    height: 570
    editable: true,
    droppable: true,
    draggable: true,
    durationEditable: true,
    eventStartEditable: true,
    eventDurationEditable: true,

    # Show heading of calendar
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,basicWeek,basicDay'
    }

    # Event sources from where data come that show on calendar.
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
    eventMouseover: (event, jsEvent, view) ->
      $(jsEvent.target).attr "title", event.description

    eventClick: (event) ->
      window.open('/events/'+event.id)
  });
