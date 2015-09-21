json.array!(@emplyees) do |emplyee|
  json.extract! emplyee, :id, :name, :manager_id
  json.url emplyee_url(emplyee, format: :json)
end
