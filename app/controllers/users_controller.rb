class UsersController < ApplicationController
    
    before_action :authenticate_user!

    
    
    def show  
    
        @user = User.find_by(id: params[:id])
        
        if @user.nil?
            redirect_to user_path(current_user), alert: "That user doest not exist yet..."
        end

    end 

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, dog_attributes[:name, :breed, :age, :gender, :weight, :fixed, :birthday], journal_entry_attributes[:title, :entry,:date], diet_entry_attributes[:food, :snacks, :water, :calories], exercise_entry_attributes[:name, :duration, :description])
    end

    
end
