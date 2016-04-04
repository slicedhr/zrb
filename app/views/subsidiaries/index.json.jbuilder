json.array!(@subsidiaries) do |subsidiary|
  json.extract! subsidiary, :id, :address, :city_id
  json.url subsidiary_url(subsidiary, format: :json)
end
