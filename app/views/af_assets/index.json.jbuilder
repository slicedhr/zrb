json.array!(@af_assets) do |af_asset|
  json.extract! af_asset, :id
  json.url af_asset_url(af_asset, format: :json)
end
