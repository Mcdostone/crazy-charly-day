json.array!(@commentaires) do |commentaire|
  json.extract! commentaire, :id, :email, :contenu, :item_id
  json.url commentaire_url(commentaire, format: :json)
end
