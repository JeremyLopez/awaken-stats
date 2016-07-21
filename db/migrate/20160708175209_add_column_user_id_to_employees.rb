class AddColumnUserIdToEmployees < ActiveRecord::Migration
  def change
		add_column :employees, :user_id, :integer, :index => true
  end
end
