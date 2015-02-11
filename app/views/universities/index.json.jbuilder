json.array!(@universities) do |university|
  json.extract! university, :id
  json.url university_url(university, format: :json)
end
