class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.date :start
      t.date :end
      t.references :employee, index: true, foreign_key: true
      t.integer :user_id
      t.float :regular
      t.float :overtime
      t.float :doubletime
      t.float :sick
      t.float :vacation
      t.float :holiday
      t.float :personal
      t.float :other

      t.timestamps null: false
    end
  end
end
