json.array!(@custodians) do |custodian|
  json.extract! custodian, :id, :full_name, :office_work, :identification, :phones, :email
  json.url custodian_url(custodian, format: :json)
end
