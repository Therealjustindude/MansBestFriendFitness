class CreateExerciseEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_entries do |t|
      t.string :name
      t.integer :duration
      t.string :description
      t.integer :journal_entry_id
      t.integer :dog_id
      t.timestamps
    end
  end
end
