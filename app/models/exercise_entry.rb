class ExerciseEntry < ApplicationRecord
    belongs_to :journal_entries, optional: true
    has_many :dogs, through: :journal_entries
end
