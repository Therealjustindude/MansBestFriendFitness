class CreateDietEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :diet_entries do |t|
      t.string :food
      t.string :snacks
      t.string :water
      t.integer :calories

      t.timestamps
    end
  end
end
