class JournalEntriesController < ApplicationController
    include JournalEntriesHelper
    before_action :authenticate_user!
    
    
    

    def show
        if current_user.id = params[:user_id]
            current_user_journal_entry
        else 
            user = User.find_by(id: params[:user_id])
            @journal_entry = user.journal_entries.find_by(id: params[:id])
        end


        if @journal_entry.nil?
            redirect_to user_path(current_user), alert: "Journal entry could not be found..."
        end
    end

    def new
        current_user_dog    
        @journal_entry = current_user.journal_entries.build(dog_id: @user_dog.id)
        @journal_entry.diet_entries.build
        @journal_entry.exercise_entries.build
    end

    def create
        current_user_dog
        @journal_entry = @user_dog.journal_entries.build(journal_entry_params)
        @journal_entry.user = current_user
        if @journal_entry.save
            redirect_to user_path(current_user)
        else
            render :new
        end 
    end

    def edit
        current_user_dog        
        current_user_journal_entry    
    end

    def update
        current_user_journal_entry
        @journal_entry.update(journal_entry_params)
        
        redirect_to user_path(current_user)
    end

    def destroy
        current_user_journal_entry
        @journal_entry.destroy
        redirect_to user_path(current_user)
    end

    private

    def journal_entry_params
        params.require(:journal_entry).permit(:title, :entry,:date, diet_entries_attributes: [:food, :snacks, :water, :calories], exercise_entries_attributes: [:name, :duration, :description])
    end
     
end
