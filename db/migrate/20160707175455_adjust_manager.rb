class AdjustManager < ActiveRecord::Migration
  def change
		change_column :employees, :manager, :boolean, :default => false, :null => false
  end
end
