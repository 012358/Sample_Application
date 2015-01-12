json.array!(@events) do |event|
  json.id event.id
  json.title event.calendar.name.upcase
  json.start event.start
  json.end event.end
  json.textColor event.calendar.color
  json.color '#E0E0E0'
end
