class AdjustPayrollTable < ActiveRecord::Migration
  def change
		remove_column :payrolls, :employee_id
  end
end
