json.array!(@types) do |type|
  json.extract! type, :id, :materiau
  json.url type_url(type, format: :json)
end
