class Dog < ApplicationRecord
    belongs_to :user
    has_many :journal_entries
    has_many :exercise_entries, through: :journal_entries
    has_many :diet_entries, through: :journal_entries

    def journal_entry_attributes=(journal_entry_attributes)
        self.journal_entry = JournalEntry.where(title: journal_entry_attributes[:title], user_id: journal_entry_attributes[:user_id]).first_or_create do |journal_entry|
          journal_entry.title= journal_entry_attributes[:title]
          journal_entry.entry= journal_entry_attributes[:entry]
          journal_entry.date= journal_entry_attributes[:date]
        end
    end
    
    def diet_entry_attributes=(diet_entry_attributes)
        self.diet_entry = DietEntry.where(journal_entry_id: diet_entry_attributes[:journal_entry_id]).first_or_create do |diet_entry|
          diet_entry.food= diet_entry_attributes[:food]
          diet_entry.snacks=diet_entry_attributes[:snacks]
          diet_entry.water= diet_entry_attributes[:water]
          diet_entry.calories= diet_entry_attributes[:calories]
        end
    end
    
    def exercise_entry_attributes=(exercise_entry_attributes)
        self.exercise_entry = ExerciseEntry.where(journal_entry_id: exercise_entry_attributes[:journal_entry_id]).first_or_create do |exercise_entry|
          exercise_entry.name= exercise_entry_attributes[:name]
          exercise_entry.duration=exercise_entry_attributes[:duration]
          exercise_entry.description= exercise_entry_attributes[:description]
        end
    end
end
