class JournalEntry < ApplicationRecord
    belongs_to :user
    belongs_to :dog
    has_many :exercise_entries, dependent: :delete_all
    has_many :diet_entries, dependent: :delete_all
    
    validates :user_id, presence: true
    validates :dog_id, presence: true
    validates :title, presence:true
    validates :entry, presence:true
    validates :date, presence:true

    
      def diet_entries_attributes=(diet_info)
        diet_obj = DietEntry.where(journal_entry_id: self.id).first_or_create do | diet_entry|
            diet_info.values.each do|info|
                diet_entry.food= info[:food]
                diet_entry.snacks=info[:snacks]
                diet_entry.water= info[:water]
                diet_entry.calories= info[:calories]
            end
        end
        
        self.diet_entries << diet_obj unless diet_info.values.first.values.any?(&:blank?)
    
      end
    
      def exercise_entries_attributes=(exercise_info)
        
        exercise_obj = ExerciseEntry.where(journal_entry_id: self.id).first_or_create do |exercise_entry|
            exercise_info.values.each do |info|
                exercise_entry.name= info[:name]
                exercise_entry.duration=info[:duration]
                exercise_entry.description= info[:description]
            end
        end
        self.exercise_entries <<  exercise_obj unless exercise_info.values.first.values.any?(&:blank?)
        
      end
    
end
