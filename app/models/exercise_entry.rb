class ExerciseEntry < ApplicationRecord
has_many :journal_entries
has_many :dogs, through: :journal_entries
end
