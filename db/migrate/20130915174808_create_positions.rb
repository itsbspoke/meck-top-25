class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title, :null => false

      t.timestamps
    end
  end
end
