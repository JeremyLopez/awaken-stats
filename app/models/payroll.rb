class Payroll < ActiveRecord::Base
	has_many :timecards
	has_many :employees, :through => :timecards
	
	def dates
		"#{start_date.strftime("%-m/%-d/%Y")} - #{end_date.strftime("%-m/%-d/%Y")}"
	end
end
