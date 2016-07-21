class AddColumnTerminatedToEmployee < ActiveRecord::Migration
  def change
		add_column :employees, :terminated, :boolean, :default => false
  end
end
