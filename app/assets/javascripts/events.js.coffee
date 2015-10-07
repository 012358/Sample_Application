$(document).on "page:change", ->

  $('#help').hide();
  $('#help-icon').click ->
    $('#help').show();


  $(document).on 'click', '.event_check_box', (event) ->
    input = $(event.target)
    $.ajax
      dataType: 'script'
      type: 'GET'
      url: input.attr("data-load-event-url")

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

    googleCalendarApiKey: 'AIzaSyBE9zIE5p7fBqu8E2XYNdjd2bYOrMMF0OE'
    eventSources: [
      {
        url: '/events.json',
        type: 'GET',
        allDay: false,
        borderColor: '#bccee0',
        textColor: 'black'
        error: ->
          alert('there was an error while fetching events!')
      }
      {
        url: 'sajjadmurtaza.nxb@gmail.com'
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
