json.array!(@skills) do |skill|
  json.extract! skill, :id, :name, :skill_type_id
  json.url skill_url(skill, format: :json)
end
