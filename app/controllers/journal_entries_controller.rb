class JournalEntriesController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!

    def show
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @dog = Dog.find_by(id: params[:dog_id])
            @journal_entry = @user.journal_entries.find_by(id: params[:id])
            if @user.nil?
              redirect_to user_journal_entries(@user), alert: "Journal entry not found"
            end
        else
            @journal_entry = JournalEntry.find(params[:id])
        end
    end

    def new
        @user = User.find_by(id: params[:user_id])
        @user_dog = @user.dogs.find_by(id: params[:dog_id])
        @journal_entry = JournalEntry.new
    end

    def create
        @user = User.find_by(id: params[:user_id])
        @user_dog = @user.dogs.find_by(id: params[:dog_id])
        @journal_entry = @user_dog.journal_entries.build(journal_entry_params)
        @journal_entry.user = current_user
            if @journal_entry.save
                redirect_to user_path(current_user)
            else
                render :new
            end 
    end

    def edit
        @user = User.find_by(id: params[:user_id])
        @user_dog = @user.dogs.find_by(id: params[:dog_id])
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
        params.require(:journal_entry).permit(:title, :entry,:date, diet_entries: [:food, :snacks, :water, :calories], exercise_entries: [:name, :duration, :description])
    end
end
