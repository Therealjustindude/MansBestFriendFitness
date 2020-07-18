class JournalEntriesController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!

    def show
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @journal_entry = @user.journal_entries.find_by(id: params[:id])
            if @user.nil?
              redirect_to user_journal_entries(@user), alert: "Journal entry not found"
            end
        else
            @journal_entry = JournalEntry.find(params[:id])
        end
    end

    def new
        @journal_entry = JournalEntry.new
    end

    def create
        @journal_entry = current_user.journal_entries.build(journal_entry_params)
            if @journal_entry.save
                redirect_to user_path(current_user)
            else
                render :new
            end 
    end

    def edit
        @journal_entry = current_user.journal_entries.find_by(id: params[:id])
    end

    def update
        journal_entry = current_user.journal_entries.find_by(id: params[:id])
        journal_entry.update(journal_entry_params)
        redirect_to user_path(current_user)
    end

    def destroy
        journal_entry = current_user.journal_entries.find_by(id: params[:id])
        journal_entry.destroy
        redirect_to user_path(current_user)
    end

    private

    def journal_entry_params
        params.require(:journal_entry).permit!
    end
end
