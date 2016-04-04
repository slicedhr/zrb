json.array!(@accounting_classifications) do |accounting_classification|
  json.extract! accounting_classification, :id, :account, :name, :ifrs_value, :local_value
  json.url accounting_classification_url(accounting_classification, format: :json)
end
