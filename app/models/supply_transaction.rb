class SupplyTransaction < ActiveRecord::Base
	validates :user_id, :presence => true
	has_many :transaction_items, :dependent => :destroy
	accepts_nested_attributes_for :transaction_items,  :reject_if => :all_blank, :allow_destroy => true

	validate :check_stock
	after_save :update_stock

	private

	def check_stock
		transaction_items.each do |item|
			supply = Supply.find( item.product_id )
			if item.transaction_type == 1 # procurement
				if supply.quantity < item.quantity 
					errors[:base] << "Quantity can't be in the greater than available stock"
				end
			else #something weird happened
			end
		end
		return true
	end

	def update_stock
		transaction_items.each do |item|
			supply = Supply.find( item.product_id )
			if item.transaction_type == 1 # procurement
				supply.quantity -= item.quantity
			elsif item.transaction_type == 2 #resupply
				supply.quantity += item.quantity
			else #something weird happened
			end
			supply.save
		end
	end
end
