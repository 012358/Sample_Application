json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :photo
  json.url contact_url(contact, format: :json)
end
