class Location < ActiveRecord::Base
	validates :name, presence: true
	has_many :employees
	
	extend FriendlyId
	friendly_id :name, :use => :slugged
end
