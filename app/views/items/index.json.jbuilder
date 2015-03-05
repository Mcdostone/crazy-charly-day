json.array!(@items) do |item|
  json.extract! item, :id, :nom, :prix, :photo, :description
  json.url item_url(item, format: :json)
end
