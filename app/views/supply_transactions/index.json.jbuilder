json.array!(@supply_transactions) do |supply_transaction|
  json.extract! supply_transaction, :id, :user_id
  json.url supply_transaction_url(supply_transaction, format: :json)
end
