class Employee < ActiveRecord::Base
	validates :name, presence: true
	validates :location_id, presence: true
  belongs_to :location
	has_many :timecards
	has_many :payrolls, :through => :timecards
	
	extend FriendlyId
	friendly_id :name, :use => :slugged
	
	def self.getEmployees(locations)
		staff = {}
		staff = {}
		locations.each do |location|
			puts "1", location.employees.order("name DESC").inspect
			staff[location.name] = location.employees.order("name DESC")
			puts "2", staff.inspect
		end
		puts "3", staff.inspect
		return staff
	end
end
