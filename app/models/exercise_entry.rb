class ExerciseEntry < ApplicationRecord
    belongs_to :journal_entries, optional: true

    #add validations
    
end
