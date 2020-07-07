class CreateExerciseEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_entries do |t|
      t.string :name
      t.time :duration
      t.string :description

      t.timestamps
    end
  end
end
