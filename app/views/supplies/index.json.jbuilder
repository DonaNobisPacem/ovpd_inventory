json.array!(@supplies) do |supply|
  json.extract! supply, :id, :name, :quantity, :group_quantity, :group_identifier, :identifier, :cost
  json.url supply_url(supply, format: :json)
end
