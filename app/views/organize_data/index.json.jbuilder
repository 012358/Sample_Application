json.array!(@organize_data) do |organize_datum|
  json.extract! organize_datum, :id, :name, :title, :parentId
  json.url organize_datum_url(organize_datum, format: :json)
end
