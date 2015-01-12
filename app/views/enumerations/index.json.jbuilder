json.array!(@enumerations) do |enumeration|
  json.extract! enumeration, :id, :name, :value, :type
  json.url enumeration_url(enumeration, format: :json)
end
