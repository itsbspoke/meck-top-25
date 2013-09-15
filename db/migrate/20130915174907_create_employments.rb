class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :employee_id, :null => false
      t.integer :position_id, :null => false
      t.decimal :salary, :null => false
      t.date :observation_date, :null => false

      t.timestamps
    end
  end
end
