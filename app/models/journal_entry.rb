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
        diet_obj= DietEntry.find_by(journal_entry_id: self.id)
        if diet_obj.nil?
          diet_obj = self.diet_entries.build
            diet_info.values.each do|info| 
                diet_obj.food= info[:food]
                diet_obj.snacks=info[:snacks]
                diet_obj.water= info[:water]
                diet_obj.calories= info[:calories]
            end
            self.diet_entries << diet_obj 
        else
          diet_params = diet_info.values[0]
          diet_obj.update(diet_params)
        end
    
      end
    
      def exercise_entries_attributes=(exercise_info)
        exercise_obj= ExerciseEntry.find_by(journal_entry_id: self.id)

        if exercise_obj.nil?
          exercise_obj = self.exercise_entries.build 
              exercise_info.values.each do |info|
                  exercise_obj.name= info[:name]
                  exercise_obj.duration=info[:duration]
                  exercise_obj.description= info[:description]
              end
          self.exercise_entries <<  exercise_obj 
        else 
          exercise_params = exercise_info.values[0]
          exercise_obj.update(exercise_params)
        end 
      end
    
end
