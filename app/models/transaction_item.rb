class TransactionItem < ActiveRecord::Base
  	belongs_to :supply_transaction
	validates :quantity, presence: true, numericality: { only_integer: true, :greater_than => 0 }
	validates :product_id, presence: true
	validates :transaction_type, presence: true
end
