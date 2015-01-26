json.array!(@important_points) do |important_point|
  json.extract! important_point, :id, :title, :description
  json.url important_point_url(important_point, format: :json)
end
