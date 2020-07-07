class CreateJournalEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.string :entry
      t.date :date
      t.integer :dog_id
      t.integer :user_id
      t.integer :diet_entry_id
      t.integer :exercise_entry_id

      t.timestamps
    end
  end
end
