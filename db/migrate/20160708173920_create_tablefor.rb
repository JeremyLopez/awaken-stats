class CreateTablefor < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.belongs_to :employee, index: true
			t.belongs_to :timecard, index: true
			t.timestamps
    end
  end
end
