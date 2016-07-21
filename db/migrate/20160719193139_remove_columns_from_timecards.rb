class RemoveColumnsFromTimecards < ActiveRecord::Migration
  def change
		remove_column :timecards, :start_date
		remove_column :timecards, :end_date
  end
end
