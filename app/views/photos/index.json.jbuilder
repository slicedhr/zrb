json.array!(@photos) do |photo|
  json.extract! photo, :id, :img_path
  json.url photo_url(photo, format: :json)
end
