# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
  calendar=$('#calendar').fullCalendar({
    height: 470
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
  });
