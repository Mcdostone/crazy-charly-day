json.array!(@pieces) do |piece|
  json.extract! piece, :id, :nom, :description
  json.url piece_url(piece, format: :json)
end
