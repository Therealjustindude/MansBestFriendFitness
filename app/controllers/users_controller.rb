class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = User.find_by(id: params[:id])
    end 

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, dog_attributes[:name, :breed, :age, :gender, :weight, :intact, :birthday])
    end
end
