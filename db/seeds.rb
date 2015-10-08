# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'roo'

User.delete_all
User.create!( {:first_name => "John Thomas Raphael", :last_name => "Dulay", :email => "johnthomasraphael@gmail.com", :password => "pass1234", :password_confirmation => "pass1234" })

TransactionType.create!(:description => "Procurement")
TransactionType.create!(:description => "Resupply")

#UP BAGUIO Offset 0
Supply.delete_all
xlsx = Roo::Spreadsheet.open('./db/source/ovpd_supplies.xlsx')
xlsx.default_sheet = xlsx.sheets[0]
2.upto(62) do |line|
	params =  
	{ :supply =>
		{
			:name => xlsx.cell(line,'A'),
			:cost => 0,
			:quantity => xlsx.cell(line, 'B'),
			:group_quantity => xlsx.cell(line, 'D'),
			:group_identifier => xlsx.cell(line, 'C'),
			:identifier => xlsx.cell(line, 'F')
		}
	}
	Supply.create!(params[:supply])
end