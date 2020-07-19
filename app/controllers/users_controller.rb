class UsersController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    
    def show  
    
         @user = User.find_by(id: params[:id])
        

    end 

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, dog_attributes[:name, :breed, :age, :gender, :weight, :intact, :birthday], journal_entry_attributes[:title, :entry,:date], diet_entry_attributes[:food, :snacks, :water, :calories], exercise_entry_attributes[:name, :duration, :description])
    end
end
