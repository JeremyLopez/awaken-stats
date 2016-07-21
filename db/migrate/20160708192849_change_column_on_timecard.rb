class ChangeColumnOnTimecard < ActiveRecord::Migration
  def change
		remove_column :timecards, :start
		remove_column :timecards, :end
		add_column :timecards, :start_date, :date
		add_column :timecards, :end_date, :date
	end
end
