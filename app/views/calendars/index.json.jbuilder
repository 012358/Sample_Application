json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :name, :color
  json.url calendar_url(calendar, format: :json)
end
