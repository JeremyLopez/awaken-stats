class Employee < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :email, presence: true
	validates :location_id, presence: true
  belongs_to :location
	
	extend FriendlyId
	friendly_id :name, :use => :slugged
	
	def self.getEmployees(locations)
		staff = {}
		locations.each do |location|
			staff[location.name] = location.employees
		end
		return staff
	end
end
