namespace :update_employee do
	desc "Update column on employees table"
	
	task :fill_in_manager => :environment do
		Employee.where(manager: nil).each do |t|
			t.update_column :terminated, false
		end
	end
end