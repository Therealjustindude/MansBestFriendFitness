class JournalEntry < ApplicationRecord
belongs_to :user
belongs_to :dog
belongs_to :exercise_entry, optional: true
belongs_to :diet_entry, optional: true
end
