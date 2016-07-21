class Timecard < ActiveRecord::Base
	belongs_to :employee
	belongs_to :payroll
#	has_one :employee, :through => :conversions
	
	@timecard_headers = [
		"user_id",
		"regular",
		"overtime",
		"doubletime",
		"sick",
		"vacation",
		"holiday",
		"personal",
		"other"
	]
	
	class DateConverter
		def self.convert(value)
			# parses custom date format into Date instance
			Date.strptime( value, '%m/%d/%Y')
		end
	end
	
	def self.gather(timecards)
	end
	
	def self.check_timecard(file)
		status = {
			id_error: [],
			successful_entry: []
		}
		
		options = { :downcase_header => false, 
								:value_converters => {:start_date => DateConverter, 
																			:end_date   => DateConverter },
								:user_provided_headers => @timecard_headers }
		
		n = SmarterCSV.process(file.tempfile, options) do |array|
			user = Employee.find_by(user_id: array.first[:user_id])
			
			if user.nil?
				puts "error"
      	status[:id_error] << array.first[:user_id]
			else
				puts "success"
				status[:successful_entry] << 
					[user.name, 
					[array.first[:regular],
					 array.first[:overtime],
					 array.first[:sick],
					 array.first[:vacation],
					 array.first[:holiday]]]
			end
		end
		
		puts status.inspect
		return status[:successful_entry], status[:id_error], file
	end
	
	def self.import(file, timecard)
		puts "EFWFEWEFWG", file
		@file = File.open(file)
		options = { :downcase_header => false, 
								:value_converters => {:start_date => DateConverter, 
																			:end_date   => DateConverter },
								:user_provided_headers => @timecard_headers }
		n = SmarterCSV.process(@file.tempfile, options) do |array|
			array.first[:employee_id] = Employee.find_by(user_id: array.first[:user_id]).id
			array.first[:payroll_id] = timecard[:payroll_id]
      Timecard.create( array.first )
		end
	end
end
