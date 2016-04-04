json.array!(@internal_locations) do |internal_location|
  json.extract! internal_location, :id, :name
  json.url internal_location_url(internal_location, format: :json)
end
