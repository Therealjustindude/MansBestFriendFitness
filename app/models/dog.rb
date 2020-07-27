class Dog < ApplicationRecord
    belongs_to :user
    has_many :journal_entries
    has_many :exercise_entries, through: :journal_entries
    has_many :diet_entries, through: :journal_entries

    validates :user_id, presence: true
    validates :name, presence: true
    validates :breed, presence: true
    validates :age, presence: true
    validates :gender, presence: true
    

end
