json.array!(@events) do |event|
  json.id event.id
  json.title "Calendar: #{event.calendar.name.upcase} \n Title: #{event.title}"
  json.start event.start
  json.end event.end
  json.textColor event.calendar.color
  json.description "Description: \n #{event.description} \n ---------------------------------------------------------------------------------------- \n Start Date: #{event.start} \n End Date: #{event.end} \n ---------------------------------------------------- \n #{event.calendar.name.upcase} has total #{event.calendar.events.count} events."
  json.color '#E0E0E0'
end
