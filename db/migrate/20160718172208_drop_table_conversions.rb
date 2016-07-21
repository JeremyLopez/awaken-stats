class DropTableConversions < ActiveRecord::Migration
  def change
		drop_table :conversions
  end
end
