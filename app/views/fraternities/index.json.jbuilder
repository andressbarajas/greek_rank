json.array!(@fraternities) do |fraternity|
  json.extract! fraternity, :id
  json.url fraternity_url(fraternity, format: :json)
end
