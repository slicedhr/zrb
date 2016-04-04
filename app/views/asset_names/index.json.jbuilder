json.array!(@asset_names) do |asset_name|
  json.extract! asset_name, :id, :name, :height, :width, :depth, :joined, :source, :purchase_price, :brand_id, :useful_life
  json.url asset_name_url(asset_name, format: :json)
end
