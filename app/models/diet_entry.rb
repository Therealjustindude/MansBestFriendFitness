class DietEntry < ApplicationRecord
    belongs_to :journal_entries, optional: true

   
end
