json.array!(@items) do |item|
  json.extract! item, :id, :nom, :prix, :photo, :description, :couleur, :piece_id, :type_id
  json.url item_url(item, format: :json)
end
