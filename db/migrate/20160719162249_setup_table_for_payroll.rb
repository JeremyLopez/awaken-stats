class SetupTableForPayroll < ActiveRecord::Migration
  def change
		add_column :payrolls, :employee_id, :integer
		add_column :timecards, :payroll_id, :integer
  end
end
