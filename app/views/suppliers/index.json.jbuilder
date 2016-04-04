json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :name, :nit, :phone, :address
  json.url supplier_url(supplier, format: :json)
end
