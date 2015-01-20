json.array!(@form2s) do |form2|
  json.extract! form2, :id, :name, :amount
  json.url form2_url(form2, format: :json)
end
