class TransactionType < ActiveRecord::Base
	validates :description, :presence => true
end
