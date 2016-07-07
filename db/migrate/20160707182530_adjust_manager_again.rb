class AdjustManagerAgain < ActiveRecord::Migration
  def change
		change_column :employees, :manager, :boolean, :default => false, :null => true
  end
end
