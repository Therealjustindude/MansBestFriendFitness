class JournalEntry < ApplicationRecord
    belongs_to :user
    belongs_to :dog
    has_many :exercise_entries
    has_many :diet_entries
end
