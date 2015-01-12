json.array!(@tagging_select_tos) do |tagging_select_to|
  json.extract! tagging_select_to, :id, :name
  json.url tagging_select_to_url(tagging_select_to, format: :json)
end
