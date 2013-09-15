class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
