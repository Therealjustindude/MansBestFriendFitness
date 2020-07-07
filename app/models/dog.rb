class Dog < ApplicationRecord
belongs_to :user
has_many :journal_entries
has_many :exercise_entries, through: :journal_entries
has_many :diet_entries, through: :journal_entries
end
