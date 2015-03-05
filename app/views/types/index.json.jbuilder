json.array!(@types) do |type|
  json.extract! type, :id, :type
  json.url type_url(type, format: :json)
end
