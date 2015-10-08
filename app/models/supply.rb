class Supply < ActiveRecord::Base
	validates :name, :presence => true
end
