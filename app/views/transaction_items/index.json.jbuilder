json.array!(@transaction_items) do |transaction_item|
  json.extract! transaction_item, :id, :transaction_id, :quantity, :product_id, :transaction_type
  json.url transaction_item_url(transaction_item, format: :json)
end
