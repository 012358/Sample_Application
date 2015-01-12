json.array!(@cocoon_examples) do |cocoon_example|
  json.extract! cocoon_example, :id, :name
  json.url cocoon_example_url(cocoon_example, format: :json)
end
