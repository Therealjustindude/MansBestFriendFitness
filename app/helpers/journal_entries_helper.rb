module JournalEntriesHelper

    def current_user_journal_entry
        @journal_entry = current_user.journal_entries.find_by(id: params[:id])
    end

    def current_user_dog
        @user_dog = current_user.dogs.find_by(id: params[:dog_id])
    end
end
