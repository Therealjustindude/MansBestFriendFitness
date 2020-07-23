class JournalEntriesController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    

    def show
            @user = User.find_by(id: params[:user_id])
            @journal_entry = @user.journal_entries.find_by(id: params[:id])
            if @journal_entry.nil?
              redirect_to user_path(@user), alert: "Journal entry not found"
            else
            @journal_entry = JournalEntry.find(params[:id])
            end
    end

    def new
        
        @user_dog = current_user.dogs.find_by(id: params[:dog_id])
    
        @journal_entry = current_user.journal_entries.build(dog_id: @user_dog.id)

        @journal_entry.diet_entries.build
        @journal_entry.exercise_entries.build
        #should I be building associations ^^^
    end

    def create
        
        @user_dog = current_user.dogs.find_by(id: params[:dog_id])

        @journal_entry = @user_dog.journal_entries.build(journal_entry_params)
        @journal_entry.user = current_user


            if @journal_entry.save
                redirect_to user_path(current_user)
            else
                render :new
            end 
    end

    def edit
        @user_dog = current_user.dogs.find_by(id: params[:dog_id])
        @journal_entry = @user_dog.journal_entries.find_by(id: params[:id])

        @diet_entry = @journal_entry.diet_entries.find_by(journal_entry_id: params[:id])

        @exercise_entry = @journal_entry.exercise_entries.find_by(journal_entry_id: params[:id])

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
        params.require(:journal_entry).permit(:title, :entry,:date, diet_entries_attributes: [:food, :snacks, :water, :calories], exercise_entries_attributes: [:name, :duration, :description])
    
    end
end
