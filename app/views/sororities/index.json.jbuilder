json.array!(@sororities) do |sorority|
  json.extract! sorority, :id
  json.url sorority_url(sorority, format: :json)
end
