class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :employee_id
      t.integer :position_id
      t.decimal :salary
      t.date :observation_date

      t.timestamps
    end
  end
end
